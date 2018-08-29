// 阴阳师合成高星式神
#include <iostream>
 
using namespace std;

unsigned long long int getNum(unsigned long int num) {
  unsigned long long int sum = 0;
  if (num == 2) {
    return 1;
  } else {
    return sum + num * getNum(num - 1);
  }
}

unsigned long long int getRes (unsigned long int num) {
  unsigned long long int res = 1;
  if (num == 2) {
    return 1;
  } else {
    for (num; num > 2; num--) {
      res *= num;
    }
  }
  return res;
}

int main() {
  unsigned long int num = 0;
  cin>>num;
  unsigned long long int res = getRes(num);
  cout<<res<<endl;
  return 0;
}
