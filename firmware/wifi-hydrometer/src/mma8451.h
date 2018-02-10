#ifndef _mma8451_h_
#define _mma8451_h_

#include <Arduino.h>

#define MMA8451_DEFAULT_ADDRESS         0x1D

#define MMA8451_OUT_X_MSB               0x01
#define MMA8451_SYSMOD                  0x0B
#define MMA8451_WHOAMI                  0x0D
#define MMA8451_XYZ_DATA_CFG            0x0E
#define MMA8451_PL_STATUS               0x10
#define MMA8451_PL_CFG                  0x11
#define MMA8451_CTRL_REG1               0x2A
#define MMA8451_CTRL_REG2               0x2B
#define MMA8451_CTRL_REG4               0x2D
#define MMA8451_CTRL_REG5               0x2E

#define MMA8451_WHOAMI_DEVID            0x1A

#define MMA8451_XYZ_DATA_CFG_FS(x)      (x << 0)
#define MMA8451_XYZ_DATA_CFG_HPF_OUT    (1 << 4)

#define MMA8451_CTRL_REG1_ACTIVE        (1 << 0)
#define MMA8451_CTRL_REG1_F_READ        (1 << 1)
#define MMA8451_CTRL_REG1_LNOISE        (1 << 2)
#define MMA8451_CTRL_REG1_DR(x)         (x << 3)
#define MMA8451_CTRL_REG1_ASLP_RATE(x)  (x << 6)

#define MMA8451_CTRL_REG2_MODS(x)       (x << 0)
#define MMA8451_CTRL_REG2_SLPE          (1 << 2)
#define MMA8451_CTRL_REG2_SMODS(x)      (x << 3)
#define MMA8451_CTRL_REG2_RST           (1 << 6)
#define MMA8451_CTRL_REG2_ST            (1 << 7)

typedef enum
{
    MMA8451_RANGE_2_G   = 0b00,
    MMA8451_RANGE_4_G   = 0b01,
    MMA8451_RANGE_8_G   = 0b10,

    MMA8451_RANGE_MASK  = 0b11
} mma8451_range_t;

typedef enum
{
    MMA8451_DATARATE_800_HZ     = 0b000,
    MMA8451_DATARATE_400_HZ     = 0b001,
    MMA8451_DATARATE_200_HZ     = 0b010,
    MMA8451_DATARATE_100_HZ     = 0b011,
    MMA8451_DATARATE_50_HZ      = 0b100,
    MMA8451_DATARATE_12_5_HZ    = 0b101,
    MMA8451_DATARATE_6_25HZ     = 0b110,
    MMA8451_DATARATE_1_56_HZ    = 0b111,

    MMA8451_DATARATE_MASK       = 0b111
} mma8451_dataRate_t;

typedef enum
{
    MMA8451_MODS_NORMAL                 = 0b00,
    MMA8451_MODS_LOW_NOISE_LOW_POWER    = 0b01,
    MMA8451_MODS_HIGH_RESOLUTION        = 0b10,
    MMA8451_MODS_LOW_POWER              = 0b11,

    MMA8451_MODS_MASK                   = 0b11
} mma8451_mods_t;

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
    void write8(uint8_t reg, uint8_t value);
    uint8_t read8(uint8_t reg);

    uint8_t _i2caddr;
};

#endif /* #ifndef _mma8451_h_ */
