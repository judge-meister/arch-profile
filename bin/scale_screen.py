#!/usr/bin/python3

import sys
import getopt
from subprocess import check_output

xrandr = check_output(['xrandr'], universal_newlines=True)


def find_native_res():
    native = ""
    for line in xrandr.split('\n'):
        if line.endswith('+'):
            native = line.split()[0]
    return native.split('x')


def find_scaled_res():
    scaled = ""
    for line in xrandr.split('\n'):
        if line.find('connected primary') > -1:
            #print(line.split())
            scaled = line.split()[3].replace('+0+0','')
    return scaled.split('x')


def find_screen_name():
    name = ""
    for line in xrandr.split('\n'):
        if line.find('connected primary') > -1:
            #print(line.split())
            name = line.split()[0]
    return name

def decrease(scale):
    scale = scale-0.05
    if scale < 1.0:
        scale = 1.0
    call_xrandr(name, "%4.2f" % scale)

def increase(scale):
    scale = scale+0.05
    if scale > 1.40:
        scale = 1.40
    call_xrandr(name, "%4.2f" % scale)


def call_xrandr(name, scale): # xrandr --output LVDS-1 --scale 1.25
    """"""
    check_output(['xrandr','--output', name, '--scale', scale], universal_newlines=True)


def usage():
    """"""
    print("Usage: scale_screen.py [-h|-s|-i|-d]")


def main(scale, name, scaled, native):
    """"""
    opts, args = getopt.getopt(sys.argv[1:], "hsdi", ["help", "scaled", "dec", "inc"])

    for o, a in opts:
        if o in ['-h', '--help']:
            usage()
            sys.exit()

        elif o in ['-s', '--scale']:
            print("%sx%s(%4.2f)" % (scaled[0], scaled[1], scale))

        elif o in ['-d', '--dec']:
            decrease(scale)

        elif o in ['-i', '--inc']:
            increase(scale)


if __name__ == '__main__':

    native = find_native_res()
    #print(native)
    scaled = find_scaled_res()
    #print(scaled)
    scale = float(scaled[0])/float(native[0])
    name = find_screen_name()

    main(scale, name, scaled, native)


