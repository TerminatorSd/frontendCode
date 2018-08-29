/* 
 ============================
 @Author:   shaoDong
 @Version:  1.0
 @DateTime: 2018-04-01 09:01:12
 @Description: print demo
 ============================
*/
#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <map>
#include <list>
#include <algorithm>

using namespace std;

typedef pair<int, int> pii;
typedef pair<int, string> pis;
typedef std::vector<pii> vpii;
typedef std::vector<pis> vpis;

template<class T>
// template<typename P>

// 打印pair类型的vector
int PrintPairVector(T t) {
  for(int i = 0; i < t.size(); i++) {
    cout<<t[i].first<<" "<<t[i].second<<endl;
  }
  return 0;
}
// 打印值为pair的map 
// int PrintPairMap (P p) {
//   for(int i = 0; i < p.size(); i++) {
//     cout<<p[i].first<<" "<<p[i].second<<endl;
//   }
//   return 0;
// }

// int main() {
//  vpii pInt;
//  pInt.push_back(make_pair(1, 2));
//  PrintPairVector(pInt);

//  vpis pStr;
//  pStr.push_back(make_pair(1, "asd"));
//  PrintPairVector(pStr);
//  return 0;
// }
 