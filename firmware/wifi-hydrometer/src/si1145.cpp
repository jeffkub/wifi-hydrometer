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

SI1145::SI1145(uint8_t addr) :
    _i2caddr(addr)
{
    return;
}

bool SI1145::begin(void)
{
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
