
/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-08-15 22:29:38
 * @Description: 判断一个整数是否是回文数
 **/

#include <iostream>
#include <string>

using namespace std;

// 字符串解法
bool isPalindromeStr(int x) 
{
    string str = to_string(x);
    int i = 0, 
        j = str.size() - 1;

    while(i < j) 
    {
        if(str[i++] != str[j--]) 
        {
            return false;
        } 
    }
    return true;
}

// 整数解法
bool isPalindromeNum(int x) 
{
    int sum = 0;
    int x2 = x;
    if(x < 0) 
    {
        return false;
    }
    while(x) {
        sum = 10 * sum + x % 10;
        x /= 10;
    }
    if(sum == x2) 
    {
        return true;
    }
    return false;
}

int main()
{
  int num = 121;
  bool res = isPalindromeNum(num);
  cout<<res<<endl;
  return 0;
}