#! /bin/bash
 
if [ $# != 1 ]
then
        echo usage: `basename $0` path_to_nmea_device
        exit
fi
 
stty raw 4800 <$1
if grep -m 1 GPRMC $1 |grep -q ,,,,,
then                                
        echo '\r' >$1
        echo '$PSRF101,0,0,0,0,0,0,12,2*16\r' >$1
fi
