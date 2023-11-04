# kadai09a 2023年06月16日

import sys

if len(sys.argv) != 2:
    print(f"usage: ./{sys.argv[0]} HEX", file=sys.stderr)
    sys.exit(1)

# 符号位置
c = int(sys.argv[1], 16)

# バイト列
bs = []

for s in (7, 5, 4, 3):
    if (c >> s) == 0:
        # マスク
        m = (0xFE << s) & 0xFF

        # 1バイト目
        b = c | m
        bs.append(b)

        break

    # 10から始まる4〜2バイト目
    b = (c & 63) | 128
    bs.append(b)

    c >>= 6

bs.reverse()

# バイト列の文字列表現
bss = [f"{b:02X}" for b in bs]

print(*bss)

# 実行コマンド + 実行結果

# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09a.py A
# 0A
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09a.py 0A
# 0A
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09a.py 0041
# 41
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09a.py 304A
# E3 81 8A
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09a.py 1F602
# F0 9F 98 82
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09a.py
# usage: ./kadai09a.py HEX
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ echo $?
# 1
