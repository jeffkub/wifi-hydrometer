#ifndef _si1145_h_
#define _si1145_h_

#include <Arduino.h>

#include "sensor.h"

#define SI1145_DEFAULT_ADDRESS          0x60

/* Register addresses */
#define SI1145_PART_ID                      0x00
#define SI1145_REV_ID                       0x01
#define SI1145_SEQ_ID                       0x02
#define SI1145_INT_CFG                      0x03
#define SI1145_IRQ_ENABLE                   0x04
#define SI1145_HW_KEY                       0x07
#define SI1145_MEAS_RATE0                   0x08
#define SI1145_MEAS_RATE1                   0x09
#define SI1145_PS_LED21                     0x0F
#define SI1145_PS_LED3                      0x10
#define SI1145_UCOEF0                       0x13
#define SI1145_UCOEF1                       0x14
#define SI1145_UCOEF2                       0x15
#define SI1145_UCOEF3                       0x16
#define SI1145_PARAM_WR                     0x17
#define SI1145_COMMAND                      0x18
#define SI1145_RESPONSE                     0x20
#define SI1145_IRQ_STATUS                   0x21
#define SI1145_ALS_VIS_DATA0                0x22
#define SI1145_ALS_VIS_DATA1                0x23
#define SI1145_ALS_IR_DATA0                 0x24
#define SI1145_ALS_IR_DATA1                 0x25
#define SI1145_PS1_DATA0                    0x26
#define SI1145_PS1_DATA1                    0x27
#define SI1145_PS2_DATA0                    0x28
#define SI1145_PS2_DATA1                    0x29
#define SI1145_PS3_DATA0                    0x2A
#define SI1145_PS3_DATA1                    0x2B
#define SI1145_AUX_DATA0                    0x2C
#define SI1145_AUX_DATA1                    0x2D
#define SI1145_PARAM_RD                     0x2E
#define SI1145_CHIP_STAT                    0x30

#define SI1145_PART_ID_SI1145               0x45

/* Commands */
#define SI1145_COMMAND_NOP                  0x00
#define SI1145_COMMAND_RESET                0x01
#define SI1145_COMMAND_BUSADDR              0x02
#define SI1145_COMMAND_PS_FORCE             0x05
#define SI1145_COMMAND_PARAM_QUERY          0x80
#define SI1145_COMMAND_PARAM_SET            0xA0

/* Parameter RAM offsets */
#define SI1145_PARAM_I2C_ADDR               0x00
#define SI1145_PARAM_CHLIST                 0x01
#define SI1145_PARAM_PSLED12_SELECT         0x02
#define SI1145_PARAM_PSLED3_SELECT          0x03
#define SI1145_PARAM_PS_ENCODING            0x05
#define SI1145_PARAM_ALS_ENCODING           0x06
#define SI1145_PARAM_PS1_ADCMUX             0x07
#define SI1145_PARAM_PS2_ADCMUX             0x08
#define SI1145_PARAM_PS3_ADCMUX             0x09
#define SI1145_PARAM_PS_ADC_COUNTER         0x0A
#define SI1145_PARAM_PS_ADC_GAIN            0x0B
#define SI1145_PARAM_PS_ADC_MISC            0x0C
#define SI1145_PARAM_ALS_IR_ADCMUX          0x0E
#define SI1145_PARAM_AUX_ADCMUX             0x0F
#define SI1145_PARAM_ALS_VIS_ADC_COUNTER    0x10
#define SI1145_PARAM_ALS_VIS_ADC_GAIN       0x11
#define SI1145_PARAM_ALS_VIS_ADC_MISC       0x12
#define SI1145_PARAM_LED_REC                0x1C
#define SI1145_PARAM_ALS_IR_ADC_COUNTER     0x1D
#define SI1145_PARAM_ALS_IR_ADC_GAIN        0x1E
#define SI1145_PARAM_ALS_IR_ADC_MISC        0x1F

#define SI1145_PARAM_CHLIST_EN_PS1          (1 << 0)
#define SI1145_PARAM_CHLIST_EN_PS2          (1 << 1)
#define SI1145_PARAM_CHLIST_EN_PS3          (1 << 2)
#define SI1145_PARAM_CHLIST_EN_ALS_VIS      (1 << 4)
#define SI1145_PARAM_CHLIST_EN_ALS_IR       (1 << 5)
#define SI1145_PARAM_CHLIST_EN_AUX          (1 << 6)
#define SI1145_PARAM_CHLIST_EN_UV           (1 << 7)

class SI1145 : public Sensor
{
public:
    SI1145(uint8_t addr = SI1145_DEFAULT_ADDRESS);

    virtual bool begin(void);

    virtual void wake(void);
    virtual void shutdown(void);

    virtual void read(void);

    /* Last sensor readings */
    float vis;
    float ir;
    float uv;

private:
    void write8(uint8_t reg, uint8_t value);

    uint8_t read8(uint8_t reg);
    uint16_t read16(uint8_t reg);

    uint8_t writeParam(uint8_t param, uint8_t value);
    uint8_t readParam(uint8_t param);

    uint8_t _i2caddr;
};

#endif /* #ifndef _si1145_h_ */
