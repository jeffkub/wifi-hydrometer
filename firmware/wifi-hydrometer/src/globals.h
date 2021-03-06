#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>

#define WIFI_SSID         "ssid"
#define WIFI_PASS         "password"

#define MQTT_SERVER       "mqttpi.rawr.lan"
#define MQTT_PORT         1883
#define MQTT_USER         "user"
#define MQTT_PASS         "pass"
#define MQTT_TOPIC_BASE   "brewing/hydrometer/hydro1"

/* Pin definitions */
#define LED_PIN           13
#define SCL_PIN           22
#define SDA_PIN           23
#define USB_SENSE_PIN     34
#define BAT_SENSE_PIN     35

#define LED_CH            0

/* ADC conversion constant */
#define BAT_ADC_SCALE ((1.1f / 4095.0f) * ((220.0f + 1000.0f) / 220.0f))

#define TIME_TO_SLEEP_US (4ULL * 60ULL * 60ULL * 1000000ULL)

#define LOG(format, ...) \
  { \
    unsigned long tmp = micros(); \
    Serial.printf("[%5d.%06d] %s: " format, tmp / 1000000, tmp % 1000000, __FUNCTION__, ##__VA_ARGS__); \
  }
