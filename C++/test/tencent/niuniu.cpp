#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
 
using namespace std;

int cmp(int a, int b) {
  return a > b;
}

int main() {
  int num = 0;
  int temp = 0;
  // score
  int sumNiu = 0;
  int sumYang = 0;
  std::vector<int> numArr;
  // input
  cin>>num;
  for(int i = 0; i < num; i++) {
    cin>>temp;
    numArr.push_back(temp);
  }
  // sort
  sort(numArr.begin(), numArr.end(), cmp);
  // fetch 
  for(int i = 0, len = numArr.size(); i < len; i++) {
    if(i % 2) {
      sumYang += numArr[i];
    } else {
      sumNiu += numArr[i];
    }
  }
  // output
  cout<<sumNiu - sumYang<<endl;
  // for (int j = 0, len = numArr.size(); j < len; j++) {
  //   cout<<numArr[j]<<" ";
  // }
  // cout<<endl;
  return 0;
}
