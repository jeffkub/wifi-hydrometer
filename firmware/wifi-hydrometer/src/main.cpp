#include <Arduino.h>
#include <WiFi.h>
#include <Wire.h>

#include <Adafruit_MCP9808.h>
#include <Adafruit_MMA8451.h>
#include <Adafruit_SI1145.h>
#include <ArduinoJson.h>
#include <MQTTClient.h>

#include "globals.h"

static Adafruit_MCP9808 temp_sensor = Adafruit_MCP9808();
static Adafruit_MMA8451 accel_sensor = Adafruit_MMA8451();
static Adafruit_SI1145 light_sensor = Adafruit_SI1145();

static WiFiClient net;
static MQTTClient client(512);

static DynamicJsonBuffer json_buffer;

RTC_DATA_ATTR unsigned long last_run_time = 0;
RTC_DATA_ATTR unsigned int wifi_conn_fail = 0;
RTC_DATA_ATTR unsigned int mqtt_conn_fail = 0;

static int init_sensors(void);
static int read_sensors(JsonObject& data);
static void wifi_event(system_event_id_t event, system_event_info_t info);
static int connect_to_wifi(const String& ssid, const String& pass);
static int connect_to_server(const String& ip, uint16_t port, const String& client_id, const String& user, const String& pass);
static int publish_data(const String& topic, JsonObject& data);

static int init_sensors(void)
{
  analogSetWidth(12);
  analogSetAttenuation(ADC_0db);
  analogSetCycles(127);

  Wire.begin(SDA_PIN, SCL_PIN);

  if(!temp_sensor.begin())
  {
    LOG("Failed to init MCP9808\n");
    return -1;
  }

  if(!accel_sensor.begin())
  {
    LOG("Failed to init MMA8451\n");
    return -1;
  }

  accel_sensor.setRange(MMA8451_RANGE_2_G);
  accel_sensor.setDataRate(MMA8451_DATARATE_1_56_HZ);

  if(!light_sensor.begin())
  {
    LOG("Failed to init SI1145\n");
    return -1;
  }

  return 0;
}

static int read_sensors(JsonObject& data)
{
  float mag;

  /* Read battery voltage */
  data["bat_v"] = analogRead(BAT_SENSE_PIN) * BAT_ADC_SCALE;

  /* Read temperature sensor */
  temp_sensor.wake();
  data["temp_f"] = temp_sensor.readTempC() * 9.0f / 5.0f + 32.0f;
  temp_sensor.shutdown();

  /* Read light sensor */
  data["light_vis"] = light_sensor.readVisible();
  data["light_ir"] = light_sensor.readIR();
  data["light_uv"] = light_sensor.readUV() / 100.0f;
  /* TODO: Low power mode */

  /* Read accelerometer sensor */
  accel_sensor.read();
  data["accel_x"] = accel_sensor.x_g;
  data["accel_y"] = accel_sensor.y_g;
  data["accel_z"] = accel_sensor.z_g;
  /* TODO: Put into standby mode */

  mag = sqrt(accel_sensor.x_g*accel_sensor.x_g + accel_sensor.y_g*accel_sensor.y_g + accel_sensor.z_g*accel_sensor.z_g);
  data["tilt"] = (M_PI_2 - acos(accel_sensor.y_g / mag)) * (180.0f / M_PI);

  /* Print to console */
  LOG("Sensor data:\n");
  data.prettyPrintTo(Serial);
  Serial.println("");

  return 0;
}

static void wifi_event(system_event_id_t event, system_event_info_t info)
{
  switch(event)
  {
    case SYSTEM_EVENT_STA_START:
    {
      LOG("STA start\n");

      break;
    }
    case SYSTEM_EVENT_STA_STOP:
    {
      LOG("STA stop\n");

      break;
    }
    case SYSTEM_EVENT_STA_CONNECTED:
    {
      LOG("STA connected\n");
      LOG("  ssid     = %*s\n",
        info.connected.ssid_len, info.connected.ssid);
      LOG("  bssid    = %02X:%02X:%02X:%02X:%02X:%02X\n",
        info.connected.bssid[0], info.connected.bssid[1], info.connected.bssid[2],
        info.connected.bssid[3], info.connected.bssid[4], info.connected.bssid[5]);
      LOG("  channel  = %d\n", info.connected.channel);
      LOG("  authmode = %d\n", info.connected.authmode);

      break;
    }
    case SYSTEM_EVENT_STA_DISCONNECTED:
    {
      LOG("STA disconnected\n");
      LOG("  ssid   = %*s\n",
        info.disconnected.ssid_len, info.disconnected.ssid);
      LOG("  bssid  = %02X:%02X:%02X:%02X:%02X:%02X\n",
        info.disconnected.bssid[0], info.disconnected.bssid[1], info.disconnected.bssid[2],
        info.disconnected.bssid[3], info.disconnected.bssid[4], info.disconnected.bssid[5]);
      LOG("  reason = %d\n", info.disconnected.reason);

      break;
    }
    case SYSTEM_EVENT_STA_AUTHMODE_CHANGE:
    {
      LOG("Auth mode changed\n");
      LOG("  old_mode = %d\n", info.auth_change.old_mode);
      LOG("  new_mode = %d\n", info.auth_change.new_mode);

      break;
    }
    case SYSTEM_EVENT_STA_GOT_IP:
    {
      IPAddress ip(info.got_ip.ip_info.ip.addr);
      IPAddress netmask(info.got_ip.ip_info.netmask.addr);
      IPAddress gw(info.got_ip.ip_info.gw.addr);

      LOG("Got IP\n");
      LOG("  ip_changed = %d\n", info.got_ip.ip_changed);
      LOG("  ip_address = %s\n", ip.toString().c_str());
      LOG("  netmask    = %s\n", netmask.toString().c_str());
      LOG("  gw         = %s\n", gw.toString().c_str());

      break;
    }
    case SYSTEM_EVENT_STA_LOST_IP:
    {
      LOG("Lost IP\n");

      break;
    }
    default:
    {
      LOG("Unknown event: %d\n", event);

      break;
    }
  }

  return;
}

static int connect_to_wifi(const String& ssid, const String& pass)
{
  int retry;

  WiFi.onEvent(wifi_event);

  for(retry = 0; retry < 3; retry++)
  {
    LOG("Connecting to %s\n", ssid);

    WiFi.begin(ssid.c_str(), pass.c_str());
    if(WiFi.waitForConnectResult() == WL_CONNECTED)
    {
      return 0;
    }

    LOG("failed\n");
    wifi_conn_fail++;

    delay(5000);
  }

  return -1;
}

static int connect_to_server(const String& ip, uint16_t port, const String& client_id, const String& user, const String& pass)
{
  int retry;

  for(retry = 0; retry < 3; retry++)
  {
    LOG("Connecting to MQTT server\n");

    client.begin(ip.c_str(), port, net);
    if(client.connect(client_id.c_str(), user.c_str(), pass.c_str()))
    {
      return 0;
    }

    LOG("failed. lastError = %d\n", client.lastError());
    mqtt_conn_fail++;

    delay(5000);
  }

  return -1;
}

static int publish_data(const String& topic, JsonObject& data)
{
  String payload;

  data["wifi_conn_fail"] = wifi_conn_fail;
  data["mqtt_conn_fail"] = mqtt_conn_fail;
  data["last_run_time"]  = last_run_time;

  data.printTo(payload);

  LOG("Publishing sensor data\n");
  LOG("  topic:   %s\n", topic.c_str());
  LOG("  payload: %s\n", payload.c_str());

  if(!client.publish(topic, payload))
  {
    LOG("failed. lastError = %d\n", client.lastError());
    return -1;
  }

  wifi_conn_fail = 0;
  mqtt_conn_fail = 0;

  return 0;
}

void setup()
{
  JsonObject& sensor_data = json_buffer.createObject();

  Serial.begin(115200);
  LOG("Program start\n");

  ledcAttachPin(LED_PIN, LED_CH);
  ledcSetup(LED_CH, 12000, 8);

  if(init_sensors())
  {
    goto sleep;
  }

  if(read_sensors(sensor_data))
  {
    goto sleep;
  }

  ledcWrite(LED_CH, 16);

  if(connect_to_wifi(WIFI_SSID, WIFI_PASS))
  {
    goto sleep;
  }

  if(connect_to_server(MQTT_SERVER, MQTT_PORT, WiFi.macAddress(), MQTT_USER, MQTT_PASS))
  {
    goto sleep;
  }

  publish_data(MQTT_TOPIC_BASE + WiFi.macAddress(), sensor_data);

sleep:
  LOG("Disconnecting\n");
  client.disconnect();
  delay(2000);
  WiFi.disconnect(true);
  delay(2000);

  ledcWrite(LED_CH, 0);

  LOG("Going to sleep\n");
  esp_sleep_enable_timer_wakeup(TIME_TO_SLEEP_US);
  last_run_time = micros();
  esp_deep_sleep_start();

  return;
}

void loop()
{
  return;
}
