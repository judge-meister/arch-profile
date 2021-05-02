#!/usr/bin/env python3

import os

BAT0 = '/sys/class/power_supply/BAT0'

def read_int_value(attr):
    val = -1
    attrpath = os.path.join(BAT0, attr)
    if os.path.exists(attrpath):
        with open(attrpath, 'r') as fp:
            val = int(fp.readlines()[0])
    return val

def read_str_value(attr):
    val = ''
    attrpath = os.path.join(BAT0, attr)
    if os.path.exists(attrpath):
        with open(attrpath, 'r') as fp:
            val = fp.readlines()[0][:-1]
    return val

def low_battery(capacity):
    HOME = os.environ['HOME']
    cmd = 'notify-send --icon="%s/.local/share/icons/battery_low_dark.png" "Very Low Battery" "Only %d%% battery remaining.\nFind a power brick now."' % (HOME, capacity)
    os.system(cmd)

Alarm = read_int_value('alarm')
ChargeNow = read_int_value('charge_now')
ChargeFull = read_int_value('charge_full')
ChargeFullDesign = read_int_value('charge_full_design')
Status = read_str_value('status')

Percent = ChargeNow * 100 / ChargeFull;
if Percent > 100.0:
    Percent = 100.0

#print("[%s]" % Status)

Result = "%2.0f%%" % Percent

if ChargeNow <= Alarm and Status == "Discharging":
    low_battery(Percent)
    Status = "Low Battery"

if ChargeNow >= ChargeFull:
    Status = "Charged"

print("%s %s" % (Result, Status))
