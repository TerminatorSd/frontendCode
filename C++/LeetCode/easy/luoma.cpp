/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-25 10:01:41
 * @modify date 2018-08-25 10:01:41
 * @desc 罗马数字转整数
*/

#include <iostream>
#include <string>
#include <map>

using namespace std;

string ixc = "IXC";
std::map<string, int> special;
std::map<char, int> numMap;

void initMap(std::map<string, int> &special, std::map<char, int> &numMap) {
    numMap['I'] = 1;
    numMap['V'] = 5;
    numMap['X'] = 10;
    numMap['L'] = 50;
    numMap['C'] = 100;
    numMap['D'] = 500;
    numMap['M'] = 1000;
    special["IV"] = 4;
    special["IX"] = 9;
    special["XL"] = 40;
    special["XC"] = 90;
    special["CD"] = 400;
    special["CM"] = 900;
}

int romanToInt(string s) {
    initMap(special, numMap);
    
    int sum = 0;
    for(int i = 0, len = s.size(); i < len; i++) 
    {
        if(ixc.find(s[i]) != string::npos) 
        {
            if(s[i + 1]) 
            {
                if(special[s.substr(i, 2)]) 
                {
                    sum += special[s.substr(i, 2)];
                    i += 1;
                    continue;
                }
            }
        }
        sum += numMap[s[i]];
    }
    return sum;
}

int main(int argc, char const *argv[])
{
    int res;
    string str;

    cin>>str;
    res = romanToInt(str);

    cout<<res<<endl;
    return 0;
}
