#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

using namespace std;

int main() {
  int sum = 0, gap = 0, temp = 0, count = 0; 
  std::vector<int> numArr;
  // input something
  cin>>sum>>gap;
  for(int i = 0; i < sum; i++) {
    cin>>temp;
    numArr.push_back(temp);
  }
  // 排序
  sort(numArr.begin(), numArr.end());
  // 去重
  numArr.erase(unique(numArr.begin(), numArr.end()), numArr.end());
  if(numArr.size() == 1) {
    count = 1;
  } else {
    // 按差值查找
    for (int i = 0; i < numArr.size(); ++i)
    {
      for (int j = i + 1; j < numArr.size(); ++j)
      {
        if(abs(numArr[i] - numArr[j]) == gap) {
          count++;
          continue;
        }
      }
    }
  }
  // 打印
  // for(int j = 0; j < numArr.size(); j++) {
  //   cout<<numArr[j]<<" ";
  // }
  // cout<<endl;
  cout<<count<<endl;
  return 0;
}