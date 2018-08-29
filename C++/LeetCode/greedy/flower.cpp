// 题目描述：花朵之间至少需要一个单位的间隔。
#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <algorithm>

using namespace std;

template<class T>

int length(T& data) {
    return sizeof(data)/sizeof(data[0]);
}

bool canPlaceFlowers(int* flowerbed, int len, int n) {
    int cnt = 0;
    for(int i = 0; i < len; i++){
        if(flowerbed[i] == 1) continue;
        int pre = i == 0 ? 0 : flowerbed[i - 1];
        int next = i == len - 1 ? 0 : flowerbed[i + 1];
        if(pre == 0 && next == 0) {
            cnt++;
            flowerbed[i] = 1;
        }
    }
    return cnt >= n;
}

int main() {
    int a[] = {1, 0, 0, 0, 1};
    int len = length(a);
    bool res = canPlaceFlowers(a, len, 1);
    cout<<res<<endl;
    return 0;
}