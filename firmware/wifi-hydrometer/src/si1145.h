#ifndef _si1145_h_
#define _si1145_h_

#include <Arduino.h>

#include "sensor.h"

#define SI1145_DEFAULT_ADDRESS          0x60

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

    uint8_t _i2caddr;
};

#endif /* #ifndef _si1145_h_ */
