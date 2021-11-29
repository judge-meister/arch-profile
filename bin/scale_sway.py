#!/usr/bin/python3

import sys
import getopt
import json
from subprocess import check_output



def decrease(name, scale):
    scale = scale+0.05
    if scale > 1.0:
        scale = 1.0
    #print(name, scale)
    call_swaymsg(name, "%4.2f" % scale)


def increase(name, scale):
    scale = scale-0.05
    if scale < 0.5:
        scale = 0.5
    #print(name, scale)
    call_swaymsg(name, "%4.2f" % scale)


def call_swaymsg(name, scale): # swaymsg 'output LVDS-1 scale 0.80'
    """sway uses reciprical of scale value"""
    ret = json.loads( check_output(['swaymsg', 'output', name, 'scale', scale], 
                                   universal_newlines=True) )
    if not ret[0]['success']:
        print(ret[0]['success'])
        print("error occured changing resolution")


def usage():
    """"""
    print("Usage: scale_sway.py [-h|-s|-i|-d]")


def main():
    """"""
    joutput = json.loads(check_output(['swaymsg', "-t", "get_outputs"], universal_newlines=True))
    name = joutput[0]['name']
    scale = float(joutput[0]['scale'])
    native = [int(joutput[0]['current_mode']['width']), int(joutput[0]['current_mode']['height'])]
    scaled = [int(native[0]/float(scale)), int(native[1]/float(scale))]

    opts, args = getopt.getopt(sys.argv[1:], "hsdi", ["help", "scaled", "dec", "inc"])

    for o, a in opts:
        if o in ['-h', '--help']:
            usage()
            sys.exit()

        elif o in ['-s', '--scale']:
            print("%sx%s(%4.2f)" % (scaled[0], scaled[1], scale))

        elif o in ['-d', '--dec']:
            decrease(name, scale)

        elif o in ['-i', '--inc']:
            increase(name, scale)


if __name__ == '__main__':

    sway = check_output(['pidof', '/usr/bin/sway'], universal_newlines=True) != ''
    if not sway:
        print("not running sway")
        sys.exit()

    main()


