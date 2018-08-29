/*
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-07-16 10:31:04
 * @Description: 反转字符串中的元音字符，使用set 结构
 */

#include <iostream>
#include <set>
#include <string>

using namespace std;

// 编译使用g++ reverseVowel.cpp -o reverseVowel -std=c++11
set<char> vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};

string doReverse(string str) {

    int i = 0,
        j = str.length();
    char temp;

    while(i < j) {
        // find 返回结果为迭代器，不是布尔类型
        if(vowels.find(str[i]) == vowels.end()) {
            i++;
        } else if(vowels.find(str[j]) == vowels.end()) {
            j--;
        } else {
            temp = str[i];
            str[i] = str[j];
            str[j] = temp;
            i++;
            j--;
        }
    }
    return str;
}

int main(int argc, char const *argv[]) {
    /* code */
    string str;
    cin>>str;

    string res = doReverse(str);
    cout<<res<<endl;
    return 0;
}
