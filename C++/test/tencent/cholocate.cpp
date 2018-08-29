#include <iostream>
 
using namespace std;

int getHalf(int num) {
  if(num == 1) {
    return 1;
  } 
  if(num % 2) {
    return num / 2 + 1;
  } else {
    return num / 2;
  }
}

int main() {
  int day = 0;
  int num = 0;
  int overflow = 0;
  int sum = 0;
  int temp = 0;
  // input
  cin>>day>>num;
  // if one day
  if(day == 1) {
    cout<<num<<endl;
    return 0;
  }
  // else
  for(int i = 1; i <= num; i++) {
    sum += i;
    temp = i;
    for(int j = 1; j < day; j++) {
      sum += getHalf(temp);
      temp = getHalf(temp);
    }
    if(sum > num) {
      overflow = i - 1;
      break;
    }
    sum = 0;
  }
  cout<<overflow<<endl;
  return 0;
}
