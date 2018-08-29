/*
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-07-02 21:31:04
 * @Description: 判断一个数组是否能通过修改一个数成为非递减数组
 */

// something should be know:
//   c++ 对数组求长度需要自己编写length 函数
//   c++ 参数为数组的时候实际上为指针传递，在函数内使用sizeof 获得的长度
//     为指针的长度而不是数组的长度
//   bool 类型值输出结果为0或1，而不是false 或true

#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <map>
#include <list>
#include <algorithm>
 
using namespace std;

template<class T>

int length(T& data) {
    return sizeof(data)/sizeof(data[0]);
}

bool isDecreasing(int* nums, int len) {
  int i = 1;
  int count = 0;
  for (; i < len; i++) {
    if (nums[i] >= nums[i-1]) {
      continue;
    }
    count++;

    // 调整数组
    if (i >= 2 && nums[i - 2] > nums[i]) {
      nums[i] = nums[i-1];
    } else {
      nums[i - 1] = nums[i];
    }
  }
  return count <= 1;
}

int main() {
  int nums[] = {4, 2, 3};
  int len = length(nums);

  bool yes = isDecreasing(nums, len);
  cout<<yes<<endl;
  return 0;
}

