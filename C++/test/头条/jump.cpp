#include <iostream>
#include <vector>

using namespace std;

int findHigher(int now, std::vector<int> vec, int gap) {
  int max = 0;
  for(int i = 0; i < vec.size(); i++) {
    if((now < vec[i]) && ((now + gap) >= vec[i])) {
      if(vec[i] > max) {
        max = vec[i];
      }
    }
  }
  return max;
}

int main() {
  int boardNum = 0;
  int jumpTimes = 0;
  int hignDiff = 0;
  int temp = 0;
  int nowHeight = 0;
  int nextHeight = 0;
  std::vector<int> vecHeight;
  // 读取数据
  cin>>boardNum>>jumpTimes>>hignDiff;
  for(int i = 0; i < boardNum; i++) {
    cin>>temp;
    vecHeight.push_back(temp);
  }
  for(int j = 0; j < jumpTimes; j++) {
    nextHeight = findHigher(nowHeight, vecHeight, hignDiff);
    // 跳
    nowHeight += (nextHeight - nowHeight) * 2;
  }

  cout<<nowHeight<<endl;
  // cout<<boardNum<<jumpTimes<<hignDiff<<endl;
  // for(int i = 0; i < boardNum; i++) {
  //   cout<<vecHeight[i]<<" ";
  // }
  // cout<<endl;
  return 0;
}