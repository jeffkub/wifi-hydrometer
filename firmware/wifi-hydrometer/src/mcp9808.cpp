#include "mcp9808.h"

#include <Wire.h>

void MCP9808::write16(uint8_t reg, uint16_t value)
{
    Wire.beginTransmission(_i2caddr);
    Wire.write(reg);
    Wire.write((value >> 8) & 0xFF);
    Wire.write((value >> 0) & 0xFF);
    Wire.endTransmission();

    return;
}

uint16_t MCP9808::read16(uint8_t reg)
{
    uint16_t value;

    Wire.beginTransmission(_i2caddr);
    Wire.write(reg);
    Wire.endTransmission();

    Wire.requestFrom(_i2caddr, (uint8_t)2);
    value = Wire.read();
    value <<= 8;
    value |= Wire.read();

    return value;
}

MCP9808::MCP9808(void)
{
    return;
}

bool MCP9808::begin(uint8_t addr)
{
    uint16_t manuf_id;
    uint16_t dev_id;

    _i2caddr = addr;

    /* Verify device */
    manuf_id = read16(MCP9808_MANUF);
    if(manuf_id != MCP9808_MANUF_ID)
    {
        return false;
    }

    dev_id = read16(MCP9808_DEV);
    if(dev_id & MCP9808_DEV_ID_MASK != MCP9808_DEV_ID)
    {
        return false;
    }

    /* Shutdown mode */
    write16(MCP9808_CONFIG, MCP9808_CONFIG_SHDN);

    return true;
}

void MCP9808::wake(void)
{
    uint16_t reg;

    reg = read16(MCP9808_CONFIG);
    reg &= ~MCP9808_CONFIG_SHDN;
    write16(MCP9808_CONFIG, reg);

    delay(250);

    return;
}

void MCP9808::shutdown(void)
{
    uint16_t reg;

    reg = read16(MCP9808_CONFIG);
    reg |= MCP9808_CONFIG_SHDN;
    write16(MCP9808_CONFIG, reg);

    return;
}

void MCP9808::read(void)
{
    int16_t reg;

    reg = read16(MCP9808_AMBIENT_TEMP);
    if(reg & MCP9808_AMBIENT_TEMP_SIGN)
    {
        /* T < 0, so sign extend */
        reg |= ~MCP9808_AMBIENT_TEMP_MASK;
    }
    else
    {
        /* T >= 0, so mask off upper bits */
        reg &= MCP9808_AMBIENT_TEMP_MASK;
    }

    temp_c = ((float)reg) / 16.0f;
    temp_f = temp_c * 9.0f / 5.0f + 32.0f;

    return;
}
