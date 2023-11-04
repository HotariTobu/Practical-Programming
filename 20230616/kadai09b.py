# kadai09b 2023年06月16日

import sys
from enum import Enum, auto

if len(sys.argv) != 2:
    print(f"usage: ./{sys.argv[0]} FILE", file=sys.stderr)
    sys.exit(1)

# パターンのリスト
psl = []

for i, s in enumerate((7, 5, 4, 3)):
    # パターン列
    ps = []

    # マスク
    m = (0xFF << s) & 0xFF

    # パターン
    p = (0xFE << s) & 0xFF

    ps.append((m, p))

    for j in range(i):
        ps.append((192, 128))

    psl.append(ps)

class MatchResult(Enum):
    MATCHING = auto()
    MATCHED = auto()
    MISMATCHED = auto()

class PatternSeq:
    def __init__(self, ps):
        self.ps = ps
        self.l = len(ps)
        self.reset()

    def reset(self):
        self.i = 0

    def match(self, b):
        m, p = self.ps[self.i]

        if (b & m) == p:
            self.i += 1

            if self.i == self.l:
                self.i = 0
                return MatchResult.MATCHED

            return MatchResult.MATCHING
        else:
            self.i = 0
            return MatchResult.MISMATCHED

psl = [PatternSeq(ps) for ps in psl]

def detchrcode(path):
    with open(path, 'rb') as f:
        for ps in psl:
            ps.reset()

        # パターン番号のカウンタ
        pic = [0] * len(psl)

        while True:
            b = f.read(1)
            if not b:
                break

            b = b[0]

            # すべてのパターンにマッチしなかったかどうか
            mis = True

            for i, ps in enumerate(psl):
                r = ps.match(b)

                if r != MatchResult.MISMATCHED:
                    mis = False

                    if r == MatchResult.MATCHED:
                        pic[i] += 1

            if mis:
                return '????'

        if any(pic[1:]):
            return 'UTF-8'

    return 'UTF-8 (ASCII only)'

try:
    chrcode = detchrcode(sys.argv[1])
except Exception as e:
    print(e, file=sys.stderr)
    sys.exit(2)

print(chrcode)

# 実行コマンド + 実行結果

# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09b.py utf-8.txt
# UTF-8
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09b.py utf-8_BOM.txt
# UTF-8
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09b.py utf-8_ASCII.txt
# UTF-8 (ASCII only)
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09b.py shift-jis.txt
# ????
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09b.py utf-16_be.txt
# ????
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09b.py utf-16_le.txt
# ????
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09b.py foobar.txt
# [Errno 2] No such file or directory: 'foobar.txt'
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09b.py
# usage: ./kadai09b.py FILE
# 2XXXX1@ISE49u:~/Practical-Programming/20230616$ python kadai09b.py empty.txt
# UTF-8 (ASCII only)
