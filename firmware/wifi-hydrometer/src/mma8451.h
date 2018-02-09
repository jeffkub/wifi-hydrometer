#ifndef _mma8451_h_
#define _mma8451_h_

#include <Arduino.h>

#define MMA8451_DEFAULT_ADDRESS     0x1D

#define MMA8451_REG_OUT_X_MSB       0x01
#define MMA8451_REG_SYSMOD          0x0B
#define MMA8451_REG_WHOAMI          0x0D
#define MMA8451_REG_XYZ_DATA_CFG    0x0E
#define MMA8451_REG_PL_STATUS       0x10
#define MMA8451_REG_PL_CFG          0x11
#define MMA8451_REG_CTRL_REG1       0x2A
#define MMA8451_REG_CTRL_REG2       0x2B
#define MMA8451_REG_CTRL_REG4       0x2D
#define MMA8451_REG_CTRL_REG5       0x2E

typedef enum
{
  MMA8451_RANGE_8_G           = 0b10,   // +/- 8g
  MMA8451_RANGE_4_G           = 0b01,   // +/- 4g
  MMA8451_RANGE_2_G           = 0b00    // +/- 2g (default value)
} mma8451_range_t;

typedef enum
{
  MMA8451_DATARATE_800_HZ     = 0b000, //  800Hz
  MMA8451_DATARATE_400_HZ     = 0b001, //  400Hz
  MMA8451_DATARATE_200_HZ     = 0b010, //  200Hz
  MMA8451_DATARATE_100_HZ     = 0b011, //  100Hz
  MMA8451_DATARATE_50_HZ      = 0b100, //   50Hz
  MMA8451_DATARATE_12_5_HZ    = 0b101, // 12.5Hz
  MMA8451_DATARATE_6_25HZ     = 0b110, // 6.25Hz
  MMA8451_DATARATE_1_56_HZ    = 0b111, // 1.56Hz

  MMA8451_DATARATE_MASK       = 0b111
} mma8451_dataRate_t;

class MMA8451
{
public:
    MMA8451(void);

    bool begin(uint8_t addr = MMA8451_DEFAULT_ADDRESS);

    void wake(void);
    void shutdown(void);

    void read(void);

    float x_g;
    float y_g;
    float z_g;

private:
    void writeReg8(uint8_t reg, uint8_t value);
    uint8_t readReg8(uint8_t reg);

    uint8_t _i2caddr;
};

#endif /*#define  _mma8451_h_ */
