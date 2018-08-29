// typedef vector< pair<string, int> > VP;
// make_pair(p.first,p.second);
// pair<string, int>p;
// #include <utility>
// #include <string>


#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

int isSame(pair<int, int> a, pair<int, int> b) {
  if((a.first + a.second) == (b.first + b.second)) {
    if((a.first == b.first) || (a.first == b.second)) {
      return 1;
    }
  }
  return 0;
}

int main() {
    int sum = 0;
    int diff = 0;
    int number = 0;
    int resLen = 0;
    std::vector<int> vectorNum;
    pair<int, int> p;
    std::vector< pair<int, int> > resVec;

    // 接收输入
    cin>>sum>>diff;
    for(int i = 0; i < sum; i++) {
      cin>>number;
      vectorNum.push_back(number);
    }

    // 查找差值为diff的对数
    for(int k = 0; k < sum; k++) {
      for(int m = k + 1; m < sum; m++) {
        if(abs(vectorNum[k] - vectorNum[m]) == diff) {
          resVec.push_back(make_pair(vectorNum[k], vectorNum[m]));
        }
      }
    }
    // 去重
    resLen = resVec.size();
    int res = resLen;
    // cout<<resLen<<endl;
    // cout<<resVec.size()<<endl;
    for(int n = 0; n < resLen; n++) {
      for(int l = n + 1; l < resLen; l++) {
        if(isSame(resVec[n], resVec[l])) {
          if(res > 0) {
            res--;
          }
        }
      }
    }
    if(res == 0) {
      res = 1;
    }
    cout<<res<<endl;
    // cout<<sum<<","<<diff<<endl;
    // for(int j = 0; j < sum; j++) {
    //   cout<<vectorNum[j]<<" ";
    // }
    // cout<<endl;
    return 0;
}