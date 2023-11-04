// kadai12b 2023年07月07日

#include <iostream>
#include <vector>

template <typename T>
struct Point3
{
    T x;
    T y;
    T z;
};

template <typename T>
std::ostream &operator<<(std::ostream &os, const Point3<T> &p)
{
    return os << "(" << p.x << ", " << p.y << ", " << p.z << ")";
}

template <typename T>
void print_container(std::vector<T>& container)
{
    auto begin = std::begin(container);
    auto end = std::end(container);

    for (auto ite = begin; ite != end; ite++)
    {
        std::cout << *ite << std::endl;
    }
}

int main()
{
    std::vector<int> values = {1, 2, 3, 4};
    print_container(values);
    std::vector<Point3<double>> points = {{0.1, 0.2, 0.3}, {0.4, 0.5, 0.6}};
    print_container(points);
}

// 実行コマンド + 実行結果

// 2XXXX1@ISE89u:~/Practical-Programming/20230707$ g++ kadai12b.cpp -o kadai12b && ./kadai12b
// 1
// 2
// 3
// 4
// (0.1, 0.2, 0.3)
// (0.4, 0.5, 0.6)
