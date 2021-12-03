#!/usr/bin/env python3
"""
update screen with a random wallpaper
"""

import os
import random
import urllib.request
from urllib.error import URLError
from bs4 import BeautifulSoup

# pylint: disable=line-too-long

#target_file_path = "/Users/user/downloaded.html" # downloaded page saved here
TARGET_URL_PATH = "http://gallery/phpgallery/?opt=1_1000&path=/zdata/stuff.backup/sdc1/Wallpaper/wallpaper+16x9/goodfon.com/"

def random_page():
    """random page"""
    pages = ['+1', '+2', '+3', '+4', '+5', '+6', '+7', '+8', '+9', '10']
    return pages[random.randint(0, len(pages)-1)]

def main():
    """ main """
    try:
        with urllib.request.urlopen(TARGET_URL_PATH+random_page()) as response:
            html_content = response.read()
            soup = BeautifulSoup(html_content, 'html.parser')

            anchors = soup.find_all('a')

            #for a in anchors:
            #    print(a.get('href'))

            pict = ""
            while not pict.endswith("jpg"):
                pict = anchors[random.randint(0, len(anchors)-1)].get('href')
            print(pict)

            os.system(f'feh --no-fehbg --bg-fill http://gallery{pict}')

    except URLError as err:
        print("Unable to download page: "+str(err.reason))


if __name__ == '__main__':

    main()
