# kadai10a 2023年06�2XXXX1003L

import sys
import subprocess as sp

from PIL import Image

if len(sys.argv) < 2:
    fname = 'sample.png'
else:
    fname = sys.argv[1]

img = Image.open(fname)
w, h = img.size

if sys.stdout.isatty():
    pro = sp.run(['tput', 'cols'], capture_output=True, text=True)
    if pro.returncode == 0:
        cols = int(pro.stdout)
        if w > cols:
            w = cols

            x = w - 1
            for y in range(h):
                img.putpixel((x, y), (255, 0, 0))

def draw(u, l=None):
    ps = '38;2;{0};{1};{2}'.format(*u)

    if l is not None:
        ps += ';48;2;{0};{1};{2}'.format(*l)

    print(f"\033[{ps}m", end='')
    print('\u2580', end='')
    print('\033[0m', end='')

for y in range(1, h, 2):
    for x in range(w):
        u = img.getpixel((x, y - 1))
        l = img.getpixel((x, y))
        draw(u, l)

    print()

if h % 2 == 1:
    for x in range(w):
        u = img.getpixel((x, h - 1))
        draw(u)

    print()

# 実行コマンド + 実行結果

# python kadai10b.py rgbw.png
# [38;2;255;0;0;48;2;0;0;255m▀[0m[38;2;0;255;0;48;2;255;255;255m▀[0m

# python kadai10b.py rgbwyk.png
# [38;2;255;0;0;48;2;0;0;255m▀[0m[38;2;0;255;0;48;2;255;255;255m▀[0m
# [38;2;255;239;0m▀[0m[38;2;0;0;0m▀[0m
