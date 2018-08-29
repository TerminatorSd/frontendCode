// 在一场运动会中，共有 n 个国家的运动员参加比赛，每个国家派出了 5 个运动员，所以一共有 5n 个运动员参加。
// 现在要求将他们排成一列纵队，但是要求每位运动员都能够挨着一个他的同胞而站，你需要计算满足这样条件的排列方案数是多少。
// 由于答案可能非常大，你只需要输出最后的答案除以1000000007后的余数即可。
#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <map>
#include <list>
#include <algorithm>
 
using namespace std;

int calNum (int num) {
  int res = 1;
  for (num; num > 1; num--) {
    res *= num;
  }
  return res;
}

int main() {
  int n = 0, res = 0;
  cin>>n;
  res = calNum(n);
  cout<<res<<endl;
  return 0;
}
