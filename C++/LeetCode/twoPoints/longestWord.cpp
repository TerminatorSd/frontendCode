/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-07-19 10:27:41
 * @modify date 2018-07-19 10:27:41
 * @desc 删除s 中的一些字符，使得它构成字符串列表d 中的一个字符串，找出能构成的最长字符串。如果有多个相同长度的结果，返回按字典序排序的最大字符串。
*/

# include <iostream>
# include <list>

using namespace std;

typedef list<string> Lst;

Lst initStrList() {
    string s[] = {"ale", "apple", "monkey", "plea"};

    // c++ 如何使用list
    Lst strList;
    strList.assign(s, s + 4);
    return strList;
}

int printStrList(Lst strList) {
    Lst::iterator lstIter;
    lstIter = strList.begin();
    while(lstIter != strList.end()) {
        cout<<*lstIter++<<endl;
    }
    return 0;
}

int main(int argc, char const *argv[])
{
    Lst strList = initStrList();
    printStrList(strList);
    return 0;
}
