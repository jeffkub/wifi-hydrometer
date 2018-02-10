#ifndef _mcp9808_h_
#define _mcp9808_h_

#include <Arduino.h>

#define MCP9808_I2CADDR_DEFAULT        0x18
#define MCP9808_REG_CONFIG             0x01

#define MCP9808_REG_CONFIG_SHUTDOWN    0x0100
#define MCP9808_REG_CONFIG_CRITLOCKED  0x0080
#define MCP9808_REG_CONFIG_WINLOCKED   0x0040
#define MCP9808_REG_CONFIG_INTCLR      0x0020
#define MCP9808_REG_CONFIG_ALERTSTAT   0x0010
#define MCP9808_REG_CONFIG_ALERTCTRL   0x0008
#define MCP9808_REG_CONFIG_ALERTSEL    0x0004
#define MCP9808_REG_CONFIG_ALERTPOL    0x0002
#define MCP9808_REG_CONFIG_ALERTMODE   0x0001

#define MCP9808_REG_UPPER_TEMP         0x02
#define MCP9808_REG_LOWER_TEMP         0x03
#define MCP9808_REG_CRIT_TEMP          0x04
#define MCP9808_REG_AMBIENT_TEMP       0x05
#define MCP9808_REG_MANUF_ID           0x06
#define MCP9808_REG_DEVICE_ID          0x07

class MCP9808
{
public:
    MCP9808(void);

    bool begin(uint8_t addr = MCP9808_I2CADDR_DEFAULT);

    void wake(void);
    void shutdown(void);

    float readTempF(void);

private:
    void write16(uint8_t reg, uint16_t value);
    uint16_t read16(uint8_t reg);

    uint8_t _i2caddr;
};

#endif /* #ifndef _mcp9808_h_ */
