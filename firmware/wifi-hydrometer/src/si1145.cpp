#include "si1145.h"

#include <Wire.h>

void SI1145::write8(uint8_t reg, uint8_t value)
{
    Wire.beginTransmission(_i2caddr);
    Wire.write(reg);
    Wire.write(value);
    Wire.endTransmission();

    return;
}

uint8_t SI1145::read8(uint8_t reg)
{
    Wire.beginTransmission(_i2caddr);
    Wire.write(reg);
    Wire.endTransmission();

    Wire.requestFrom(_i2caddr, (uint8_t)1);
    return Wire.read();
}

uint16_t SI1145::read16(uint8_t reg)
{
    uint16_t value;

    Wire.beginTransmission(_i2caddr);
    Wire.write(reg);
    Wire.endTransmission();

    Wire.requestFrom(_i2caddr, (uint8_t)2);
    value = Wire.read();
    value |= (uint16_t)Wire.read() << 8;

    return value;
}

uint8_t SI1145::writeParam(uint8_t param, uint8_t value)
{
    write8(SI1145_PARAM_WR, value);
    write8(SI1145_COMMAND, SI1145_COMMAND_PARAM_SET | param);
    return read8(SI1145_PARAM_RD);
}

uint8_t SI1145::readParam(uint8_t param)
{
    write8(SI1145_COMMAND, SI1145_COMMAND_PARAM_QUERY | param);
    return read8(SI1145_PARAM_RD);
}

SI1145::SI1145(uint8_t addr) :
    _i2caddr(addr)
{
    return;
}

bool SI1145::begin(void)
{
    uint8_t part_id;

    part_id = read8(SI1145_PART_ID);
    if(part_id != SI1145_PART_ID_SI1145)
    {
        return false;
    }

    write8(SI1145_COMMAND, SI1145_COMMAND_RESET);
    delay(10);

    write8(SI1145_HW_KEY, 0x17);
    delay(10);

    /* Enable UV index measurement coefficients */
    write8(SI1145_UCOEF0, 0x29);
    write8(SI1145_UCOEF1, 0x89);
    write8(SI1145_UCOEF2, 0x02);
    write8(SI1145_UCOEF3, 0x00);

    /* Enable UV sensor */
    writeParam(SI1145_PARAM_CHLIST,
        SI1145_PARAM_CHLIST_EN_UV |
        SI1145_PARAM_CHLIST_EN_ALS_IR |
        SI1145_PARAM_CHLIST_EN_ALS_VIS);

    return true;
}

void SI1145::wake(void)
{
    return;
}

void SI1145::shutdown(void)
{
    return;
}

void SI1145::read(void)
{
    return;
}
