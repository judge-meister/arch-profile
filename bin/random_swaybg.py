#!/usr/bin/env python3
"""
update screen with a random wallpaper
"""

import os
import random
from subprocess import check_output
import psutil

# pylint: disable=line-too-long

#target_file_path = "/Users/user/downloaded.html" # downloaded page saved here
TARGET_URL_PATH = "http://gallery/phpgallery/?opt=1_1000&path=/zdata/stuff.backup/sdc1/Wallpaper/wallpaper+16x9/goodfon.com/"


def swaybg(url):
    """need to kill off old swaybg"""
    pid = -1
    for proc in psutil.process_iter():
        if 'swaybg' in proc.name():
            pid = proc.pid

    os.system(f'swaybg -m fill -i {url} &')

    if pid >= -1:
        check_output(['kill', f'{pid}'])

def set_wallpaper(url):
    """call feh or swaybg depending if using sway or not"""
    if os.getenv('WAYLAND_DISPLAY','') != '':
        swaybg(url)

def random_page():
    """random page"""
    pages = ['+1', '+2', '+3', '+4', '+5', '+6', '+7', '+8', '+9', '10']
    return pages[random.randint(0, len(pages)-1)]

def get_list_of_pictures():
    """get pic list"""
    paths = []
    for root, _dirn, filen in os.walk('/home/judge/Pictures', followlinks=True):
        for file in filen:
            paths.append(os.path.join(root, file))
    return paths

def main():
    """ main """
    pics = get_list_of_pictures()
    rand_pic = pics[random.randint(0, len(pics)-1)]

    print(rand_pic)

    set_wallpaper(f'{rand_pic}')



if __name__ == '__main__':

    main()
