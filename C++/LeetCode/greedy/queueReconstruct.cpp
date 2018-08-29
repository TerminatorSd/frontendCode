/* 
 ============================
 @Author:   shaoDong
 @Version:  1.0
 @DateTime: 2018-03-31 21:29:39
 @Description: queueReconstruct
 ============================
*/
#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <algorithm>
#include "../../foundation/print.cpp"

using namespace std;

typedef pair<int, int> pii;
typedef std::vector<pii> vpii;

template<class T>
// 获取数组长度
int length(T& data) {
    return sizeof(data)/sizeof(data[0]);
}
// 排序规则
bool cmp(pii x, pii y) {
  if(x.first != y.first) return x.first > y.first;
  return x.second < y.second;
}

int main() {
  vpii input;
  vpii res;
  int in[][2] = {{7,0}, {4,4}, {7,1}, {5,0}, {6,1}, {5,2}};
  int len = length(in);
  // 像Vector中插入数据
  for(int i = 0; i < len; i++) {
    input.push_back(make_pair(in[i][0], in[i][1]));
  }
  // 排序
  sort(input.begin(), input.end(), cmp);
  // 输出查看
  // PrintPairVector(input);
  // 重新插入
  for(int i = 0; i < len; i++) {
    res.insert(res.begin() + input[i].second, make_pair(input[i].first, input[i].second));
  }
  // 输出查看
  PrintPairVector(res);
  return 0;
}
