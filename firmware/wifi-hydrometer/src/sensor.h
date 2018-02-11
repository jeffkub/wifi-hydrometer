#ifndef _sensor_h_
#define _sensor_h_

#include <Arduino.h>

class Sensor
{
public:
    virtual bool begin(void) = 0;

    virtual void wake(void) = 0;
    virtual void shutdown(void) = 0;

    virtual void read(void) = 0;
};

#endif /* #ifndef _sensor_h_ */
