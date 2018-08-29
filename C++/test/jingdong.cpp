#include <iostream>
#include <vector>
 
using namespace std;

int main () {
  int n = 0;
  cin>>n;
  std::vector<int> numArr;
  unsigned long res = 1;
  // 建立数组
  for (int k = 1; k <= n; k++) {
    numArr.push_back(k);
  }

  if (n == 1) {
    cout<<1<<endl;
  } else {
    // 消除公约数
    for (int i = 2; i <= n; i++) {
      for (int j = i + 1; j <= n; j++) {
        if (j % i) {
          // 不能整除
        } else {
          numArr[i - 1] = 1;
        }
      }
    }
    // 计算最小的数
    for(int m = 0; m < n; m++) {
      res *= numArr[m];
    }
    cout<<res % 987654321<<endl;
  }
  return 0;
}



