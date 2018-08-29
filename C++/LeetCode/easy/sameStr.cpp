/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-19 10:32:51
 * @modify date 2018-08-19 10:32:51
 * @desc 字符串数组最长公共前缀，vecto 操作
 * -std=c++11 特性：auto
*/

#include <iostream>
#include <vector>
#include <string>

using namespace std;

// 逐字符对比
// string longestCommonPrefix(vector<string>& strs) {
//     if(strs.size() == 0) {
//         return "";
//     }
//     bool flag = false;
//     int i;
//     for(i = 0; i < strs[0].size(); i++) {
//         for(auto it = strs.begin() + 1; it != strs.end(); it++) {
//             // 取当前的值
//             // cout<<*it<<endl;
//             if(i > (*it).size() - 1 || (*it)[i] != strs[0][i]) {
//                 flag = true;
//                 break;
//             }
//         }
//         if(flag) {
//             break;
//         }
//     }
//     string res = strs[0].substr(0, i);
    
//     return res;
// }

// 逐字符串对比
int compareStr(string &a, string &b) {
    int lenA = a.size();
    int lenB = b.size();
    int len = lenA > lenB ? lenB : lenA;
    for(int i = 0; i < len; i++) {
        if(a[i] != b[i]) {
            return i;
        }
    }
    return len;
}

string longestCommonPrefix(vector<string>& strs) {
    if(strs.size() == 0) {
        return "";
    }
    string tempStr = strs[0];
    for(auto it = strs.begin() + 1; it != strs.end(); it++) {
        tempStr = (*it).substr(0, compareStr(tempStr, (*it)));
        if(tempStr == "") {
            break;
        }
    }
    
    return tempStr;
}

int main(int argc, char const *argv[])
{
    // c++ 11
    vector<string> strVec = {"flower", "flow", "flight"};
    // vector<string> strVec = {"dog","racecar","car"};

    string res = longestCommonPrefix(strVec);

    cout<<res<<endl;
    return 0;
}
