/* 
 ============================
 @Author:   shaoDong
 @Version:  1.0
 @DateTime: 2018-03-31 21:28:58
 @Description: map
 ============================
*/

#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <map>
#include <algorithm>
#include "print.cpp"

using namespace std;

typedef pair<int, int> pii;
typedef map<int, pii> mpii;

int main() {
  mpii pairMap;
  pairMap['a'] = make_pair(1, 2);
  pairMap[1] = make_pair(1, 3);
  // cout<<pairMap['a'].first<<endl;
  PrintPairVector(pairMap['a']);
  // for(int i = 0; i < pairMap.size(); i++) {
  //   cout<<pairMap[i].first<<" "<<pairMap[i].second<<endl;
  // }
  return 0;
}