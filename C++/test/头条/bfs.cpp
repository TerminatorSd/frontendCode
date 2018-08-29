// 两种操作 m = s; s = s +s
//         s = s + m
// 从一个初始字符串'a'长到固定长度需要多少次运算

#include <iostream>
#include <queue>
#include <map>

using namespace std;
typedef pair<int,int> pii;
map<pair<int,int> , int > mp;
int main()
{
    int n;
    cin>>n;
    queue<pii> q;
    q.push(make_pair(1, 1));
    mp[make_pair(1,1)]=0;
    while(!q.empty())
    {
        pii pr = q.front();
        q.pop();
        if(pr.first == n)
        {
            cout<<mp[pr]<<endl;
            exit(0);
        }
        pii t=pr;
        t.second = t.first; t.first*=2;
        if(!mp.count(t))
        {
            q.push(t);
            mp[t] = mp[pr]+1;
        }
        t=pr;
        t.first=t.first+t.second;
        if(!mp.count(t))
        {
            q.push(t);
            mp[t] = mp[pr]+1;
        }
    }
    return 0;
}