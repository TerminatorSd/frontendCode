/* 
 ============================
 @Author:   shaoDong
 @Version:  1.0
 @DateTime: 2018-03-31 21:34:27
 @Description: vector demo
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
typedef vector<pii> vpii;

int main() {
  vpii vecPair;
  vecPair.insert(vecPair.begin() + 0, make_pair(1, 2));
  vecPair.insert(vecPair.begin() + 1, make_pair(1, 3));
  vecPair.insert(vecPair.begin() + 2, make_pair(1, 3));
  vecPair.insert(vecPair.begin() + 2, make_pair(1, 3));
  cout<<vecPair.size()<<endl;
  // here is the code
  return 0;
}
