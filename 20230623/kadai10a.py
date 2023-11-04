# kadai10a 2023年06�2XXXX1003L

import sys
import numpy as np

from PIL import Image

if len(sys.argv) < 2:
    fname = 'sample.png'
else:
    fname = sys.argv[1]

img = Image.open(fname)
w, h = img.size

for y in range(h):
    for x in range(w):
        r, g, b = img.getpixel((x, y))
        print(f"\033[48;2;{r};{g};{b}m", end='')
        print('　', end='')
        print('\033[0m', end='')

    print()

# 実行コマンド + 実行絝果

# python kadai10a.py rgbw.png
# [48;2;255;0;0m　[0m[48;2;0;255;0m　[0m
# [48;2;0;0;255m　[0m[48;2;255;255;255m　[0m

# python kadai10a.py rgbwyk.png
# [48;2;255;0;0m　[0m[48;2;0;255;0m　[0m
# [48;2;0;0;255m　[0m[48;2;255;255;255m　[0m
# [48;2;255;239;0m　[0m[48;2;0;0;0m　[0m
