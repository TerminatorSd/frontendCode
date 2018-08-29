#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
 
using namespace std;

int getNum(int have, int m) {
  if(have <= m) {
    return 1;
  } else if(have % m) {
    return have / m + 1;
  } else {
    return have / m;
  }
}

int main() {
  int n = 0;
  int m = 0;
  string temp;
  int numY = 0;
  int numB = 0;
  int numG = 0;
  int res = 0;
  std::vector<string> stringArr;
  // input
  cin>>n>>m;
  for(int i = 0; i < n; i++) {
    cin>>temp;
    stringArr.push_back(temp);
  }
  // compute
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < m; j++) {
      if(stringArr[i][j] == 'Y') {
        numY++;
      }
      else if(stringArr[i][j] == 'B') {
        numB++;
      }
      else if(stringArr[i][j] == 'G') {
        numG++;
      }
    }
  }
  res = max(getNum(numY, m), getNum(numB, m));
  res = max(res, numG) + 1;
  // res += getNum(numY, m);
  // res += getNum(numB, m);
  // output
  cout<<res<<endl;
  return 0;
}
