#include "mma8451.h"

#include <Wire.h>

#define DIVIDER 4096.0f

void MMA8451::writeReg8(uint8_t reg, uint8_t value)
{
    Wire.beginTransmission(_i2caddr);
    Wire.write(reg);
    Wire.write(value);
    Wire.endTransmission();

    return;
}

uint8_t MMA8451::readReg8(uint8_t reg)
{
    Wire.beginTransmission(_i2caddr);
    Wire.write(reg);
    Wire.endTransmission(false);

    Wire.requestFrom(_i2caddr, (uint8_t)1);
    if(!Wire.available()) return -1;
    return Wire.read();
}

MMA8451::MMA8451(void)
{
    return;
}

bool MMA8451::begin(uint8_t addr)
{
    uint8_t device_id;

    _i2caddr = addr;

    /* Check connection */
    device_id = readReg8(MMA8451_REG_WHOAMI);
    if(device_id != 0x1A)
    {
        return false;
    }

    /* Reset device */
    writeReg8(MMA8451_REG_CTRL_REG2, 0x40);
    while(readReg8(MMA8451_REG_CTRL_REG2) & 0x40);

    /* Enable 2G range */
    writeReg8(MMA8451_REG_XYZ_DATA_CFG, MMA8451_RANGE_2_G);
    /* High resolution oversampling mode */
    writeReg8(MMA8451_REG_CTRL_REG2, 0x02);
    /* Set data rate, low noise mode */
    writeReg8(MMA8451_REG_CTRL_REG1, (MMA8451_DATARATE_6_25HZ << 3) | 0x04);

    return true;
}

void MMA8451::wake(void)
{
    uint8_t reg;

    reg = readReg8(MMA8451_REG_CTRL_REG1);
    reg |= 0x1;
    writeReg8(MMA8451_REG_CTRL_REG1, reg);

    return;
}

void MMA8451::shutdown(void)
{
    uint8_t reg;

    reg = readReg8(MMA8451_REG_CTRL_REG1);
    reg &= ~0x1;
    writeReg8(MMA8451_REG_CTRL_REG1, reg);

    return;
}

void MMA8451::read(void)
{
    int16_t x;
    int16_t y;
    int16_t z;

    Wire.beginTransmission(_i2caddr);
    Wire.write(MMA8451_REG_OUT_X_MSB);
    Wire.endTransmission(false);

    Wire.requestFrom(_i2caddr, (uint8_t)6);

    x = Wire.read();
    x <<= 8;
    x |= Wire.read();
    x >>= 2;

    y = Wire.read();
    y <<= 8;
    y |= Wire.read();
    y >>= 2;

    z = Wire.read();
    z <<= 8;
    z |= Wire.read();
    z >>= 2;

    x_g = (float)x / DIVIDER;
    y_g = (float)y / DIVIDER;
    z_g = (float)z / DIVIDER;

    return;
}
