#ifndef _mcp9808_h_
#define _mcp9808_h_

#include <Arduino.h>

#include "sensor.h"

#define MCP9808_DEFAULT_ADDRESS         0x18

#define MCP9808_CONFIG                  0x01
#define MCP9808_UPPER_TEMP              0x02
#define MCP9808_LOWER_TEMP              0x03
#define MCP9808_CRIT_TEMP               0x04
#define MCP9808_AMBIENT_TEMP            0x05
#define MCP9808_MANUF                   0x06
#define MCP9808_DEV                     0x07
#define MCP9808_RESOLUTION              0x08

#define MCP9808_CONFIG_ALERTMOD         (1 << 0)
#define MCP9808_CONFIG_ALERTPOL         (1 << 1)
#define MCP9808_CONFIG_ALERTSEL         (1 << 2)
#define MCP9808_CONFIG_ALERTCNT         (1 << 3)
#define MCP9808_CONFIG_ALERTSTAT        (1 << 4)
#define MCP9808_CONFIG_INTCLR           (1 << 5)
#define MCP9808_CONFIG_WINLOCK          (1 << 6)
#define MCP9808_CONFIG_CRITLOCK         (1 << 7)
#define MCP9808_CONFIG_SHDN             (1 << 8)

#define MCP9808_AMBIENT_TEMP_SIGN       (1 << 12)
#define MCP9808_AMBIENT_TEMP_MASK       (0x0FFF)

#define MCP9808_MANUF_ID                (0x0054)

#define MCP9808_DEV_ID                  (0x04 << 8)
#define MCP9808_DEV_ID_MASK             (0xFF << 8)
#define MCP9808_DEV_REV_MASK            (0xFF << 0)

typedef enum
{
    MMA8451_RESOLUTION_0_5      = 0b00,
    MMA8451_RESOLUTION_0_25     = 0b01,
    MMA8451_RESOLUTION_0_125    = 0b10,
    MMA8451_RESOLUTION_0_0625   = 0b11,

    MMA8451_RESOLUTION_MASK     = 0b11
} mcp9808_resolution_t;

class MCP9808 : public Sensor
{
public:
    MCP9808(uint8_t addr = MCP9808_DEFAULT_ADDRESS);

    virtual bool begin(void);

    virtual void wake(void);
    virtual void shutdown(void);

    virtual void read(void);

    /* Last sensor readings */
    float temp_c;
    float temp_f;

private:
    void write16(uint8_t reg, uint16_t value);
    uint16_t read16(uint8_t reg);

    uint8_t _i2caddr;
};

#endif /* #ifndef _mcp9808_h_ */
