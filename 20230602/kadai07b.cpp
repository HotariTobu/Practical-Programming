// kadai07b 2023年06月02日

#include <iostream>
#include <fstream>
#include <regex>
#include <string>

int main(int argc, const char* argv[]) {
    if (argc != 2) {
        std::cerr << "usage: " << argv[0] << " FILE" << std::endl;
        exit(1);
    }

    std::ifstream ifs(argv[1]);
    if (!ifs) {
        std::cerr << "open failed: " << argv[1] << std::endl;
        exit(2);
    }

    std::string text {
        std::istreambuf_iterator<char>{ifs},
        std::istreambuf_iterator<char>{}
    };

    ifs.close();

    // // テキストの内容を出力
    // std::cout << "読み込んだテキスト:\n" << text << std::endl;

    std::regex regex{R"(.?0([0-9]+).([0-9]+).([0-9]+))"};
    auto format = "\033[31m+81-$1-$2-$3\033[0m";

    auto replaced_text = std::regex_replace(text, regex, format);

    std::cout << replaced_text << std::endl;
}

/* 実行結果 **********************************************************
2XXXX1@ISE69u:~/Practical-Programming/20230602$ ./kadai07b
usage: ./kadai07b FILE
2XXXX1@ISE69u:~/Practical-Programming/20230602$ ./kadai07b hogeng
open failed: hogeng
2XXXX1@ISE69u:~/Practical-Programming/20230602$ ./kadai07b <(echo $'001-370-3245\n04859(7)3845\n0806-24-8766\n(03889)7-6865\n0153(46)6564\n電話番号01-1: (09)7463-5961, 電話番号01-2: 07683-1-0723\n電話番号02-1: 01268-3-0643, 電話番号02-2: 03530(3)4158\n電話番号03-1: 054-983-3717, 電話番号03-2: (0552)15-7239\n電話番号04-1: 002-229-6062, 電話番号04-2: 00(9002)0452\n電話番号05-1: (03995)8-0740, 電話番号05-2: 09751-8-2929\n')
+81-1-370-3245
+81-4859-7-3845
+81-806-24-8766
+81-3889-7-6865
+81-153-46-6564
電話番号01-1: +81-9-7463-5961, 電話番号01-2:+81-7683-1-0723
電話番号02-1:+81-1268-3-0643, 電話番号02-2:+81-3530-3-4158
電話番号03-1:+81-54-983-3717, 電話番号03-2: +81-552-15-7239
電話番号04-1:+81-02-229-6062, 電話番号04-2:+81-0-9002-0452
電話番号05-1: +81-3995-8-0740, 電話番号05-2:+81-9751-8-2929
*********************************************************************/
