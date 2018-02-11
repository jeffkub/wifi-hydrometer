#include "mma8451.h"

#include <Wire.h>

#define DIVIDER 4096.0f

void MMA8451::write8(uint8_t reg, uint8_t value)
{
    Wire.beginTransmission(_i2caddr);
    Wire.write(reg);
    Wire.write(value);
    Wire.endTransmission();

    return;
}

uint8_t MMA8451::read8(uint8_t reg)
{
    Wire.beginTransmission(_i2caddr);
    Wire.write(reg);
    Wire.endTransmission(false);

    Wire.requestFrom(_i2caddr, (uint8_t)1);
    return Wire.read();
}

MMA8451::MMA8451(uint8_t addr) :
    _i2caddr(addr)
{
    return;
}

bool MMA8451::begin(void)
{
    uint8_t device_id;

    /* Check connection */
    device_id = read8(MMA8451_WHOAMI);
    if(device_id != MMA8451_WHOAMI_DEVID)
    {
        return false;
    }

    /* Reset device */
    write8(MMA8451_CTRL_REG2, MMA8451_CTRL_REG2_RST);
    while(read8(MMA8451_CTRL_REG2) & MMA8451_CTRL_REG2_RST);

    /* Enable 2G range */
    write8(MMA8451_XYZ_DATA_CFG,
        MMA8451_XYZ_DATA_CFG_FS(MMA8451_RANGE_2_G));
    /* High resolution oversampling mode */
    write8(MMA8451_CTRL_REG2,
        MMA8451_CTRL_REG2_MODS(MMA8451_MODS_HIGH_RESOLUTION));
    /* Set data rate, low noise mode */
    write8(MMA8451_CTRL_REG1,
        MMA8451_CTRL_REG1_DR(MMA8451_DATARATE_6_25HZ) |
        MMA8451_CTRL_REG1_LNOISE);

    return true;
}

void MMA8451::wake(void)
{
    uint8_t reg;

    reg = read8(MMA8451_CTRL_REG1);
    reg |= MMA8451_CTRL_REG1_ACTIVE;
    write8(MMA8451_CTRL_REG1, reg);

    /* Wait for t_on1 */
    delay(500);

    return;
}

void MMA8451::shutdown(void)
{
    uint8_t reg;

    reg = read8(MMA8451_CTRL_REG1);
    reg &= ~MMA8451_CTRL_REG1_ACTIVE;
    write8(MMA8451_CTRL_REG1, reg);

    return;
}

void MMA8451::read(void)
{
    int16_t x;
    int16_t y;
    int16_t z;

    Wire.beginTransmission(_i2caddr);
    Wire.write(MMA8451_OUT_X_MSB);
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
