#include <iostream>
#include <bit>

int main() {
    if (std::endian::native == std::endian::little) {
        std::cout << "リトルエンディアン" << std::endl;
    }
    if (std::endian::native == std::endian::big) {
        std::cout << "ビッグエンディアン" << std::endl;
    }
}