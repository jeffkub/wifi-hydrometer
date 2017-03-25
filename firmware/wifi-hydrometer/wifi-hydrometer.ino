#include <ESP8266WiFi.h>
#include <Adafruit_MCP9808.h>
#include <Adafruit_MMA8451.h>

#include "Ubidots.h"

#define LED_PIN      0

#define WIFI_SSID    "ssid"
#define WIFI_PASS    "pass"

#define TOKEN        "token"
#define DEVICE       "hydrometer-1"

#define BATT_VOLT_ID "batt-volt"
#define TEMP_ID      "temp"
#define TILT_ID      "tilt"
#define RSSI_ID      "rssi"

#define SLEEP_TIME_S (30 * 60)

static const float ADC_TO_BAT_VOLT = 1.0f / 1024.0f / (301.0f / 1301.0f);

Adafruit_MCP9808 tempSensor = Adafruit_MCP9808();
Adafruit_MMA8451 accelSensor = Adafruit_MMA8451();

Ubidots ubiclient(TOKEN, DEVICE);

float battVolt = 0.0f;
float temp = 0.0f;
float tilt = 0.0f;

void readBat(void)
{
  battVolt = (float)analogRead(A0) * ADC_TO_BAT_VOLT;
  
  Serial.print("Battery: "); Serial.print(battVolt); Serial.println("V");

  return;
}

void readTemp(void)
{
  if(!tempSensor.begin())
  {
    Serial.println("Couldn't find MCP9808");
    return;
  }
  
  tempSensor.shutdown_wake(0);
  delay(350);
  temp = tempSensor.readTempC() * (9.0 / 5.0) + 32.0;
  tempSensor.shutdown_wake(1);

  Serial.print("Temp: "); Serial.print(temp); Serial.println("F");

  return;
}

void readAccel(void)
{
  float accelX = 0.0f;
  float accelY = 0.0f;
  float accelZ = 0.0f;
  float mag;
  
  if (!accelSensor.begin())
  {
    Serial.println("Couldnt find MMA8451");
    return;
  }
  
  accelSensor.setRange(MMA8451_RANGE_2_G);
  accelSensor.setDataRate(MMA8451_DATARATE_1_56_HZ);

  accelSensor.read();
  
  accelX = (float)accelSensor.x_g;
  accelY = (float)accelSensor.y_g;
  accelZ = (float)accelSensor.z_g;
  mag = sqrt(accelX*accelX + accelY*accelY + accelZ*accelZ);
  
  tilt = (M_PI_2 - acos(-accelX / mag)) * (180.0f / M_PI);
  
  Serial.print("Accel X: "); Serial.print(accelX); Serial.println("g");
  Serial.print("Accel Y: "); Serial.print(accelY); Serial.println("g");
  Serial.print("Accel Z: "); Serial.print(accelZ); Serial.println("g");
  Serial.print("Tilt: "); Serial.print(tilt); Serial.println("deg");

  return;
}

void sendData()
{
  if(!ubiclient.wifiConnection(WIFI_SSID, WIFI_PASS))
  {
    Serial.println("Failed to connect");
    return;
  }

  ubiclient.add(BATT_VOLT_ID, battVolt);
  ubiclient.add(TEMP_ID, temp);
  ubiclient.add(TILT_ID, tilt);
  ubiclient.add(RSSI_ID, (float)WiFi.RSSI());
  
  ubiclient.sendAll();

  return;
}

void setup()
{
  pinMode(LED_PIN, OUTPUT);

  Serial.begin(9600);
  Serial.println("Program start");

  digitalWrite(LED_PIN, LOW);

  /* Read sensors */
  readBat();
  readTemp();
  readAccel();

  /* Send data to the clouuuud */
  sendData();

  digitalWrite(LED_PIN, HIGH);

  /* Go into deep sleep */
  ESP.deepSleep(SLEEP_TIME_S * 1000000);

  return;
}

void loop()
{
  return;
}

