// 梯度上升爬山
#include <iostream>
#include <queue>
#include <map>
 
using namespace std;
typedef pair<int, int> pii;
map<pii, int> mp;
int n, m;
int nowMax = 0;
queue<pii> qe;

int seeAround(pii pr) {
  // 获取当前坐标
  int x = pr.first;
  int y = pr.second;
  int num = mp[pr];
  // cout<<x<<" "<<y<<endl;
  if (x > 1) {
    // 左边有元素
    int now = mp[make_pair(x - 1, y)];
    if (now >= num) {
      qe.push(make_pair(x - 1, y));
      if (now > nowMax) {
        nowMax = now;
      }
    }
  }
  if (x < n) {
    // 右边有元素
    int now = mp[make_pair(x + 1, y)];
    // cout<<"x<m: "<<now<<" "<<num<<endl;
    if (now >= num) {
      qe.push(make_pair(x + 1, y));
      if (now > nowMax) {
        nowMax = now;
      }
    }
  }
  if (y > 1) {
    // 上边有元素
    int now = mp[make_pair(x, y - 1)];
    if (now >= num) {
      qe.push(make_pair(x, y -1));
      if (now > nowMax) {
        nowMax = now;
      }
    }
  } 
  if (y < m) {
    // 下边有元素
    int now = mp[make_pair(x, y + 1)];
    // cout<<"y<n: "<<now<<" "<<num<<endl;
    if (now >= num) {
      qe.push(make_pair(x, y + 1));
      if (now > nowMax) {
        nowMax = now;
      }
    }
  }
  return 0;
}

int main() {
  // input
  pii nowPos;
  cin>>n>>m;
  cin>>nowPos.first>>nowPos.second;
  for(int i = 1; i <= n; i++) {
    for (int j = 1; j <= m; ++j) {
      int height = 0;
      cin>>height;
      mp[make_pair(i, j)] = height;
    }
  }
  // print
  // cout<<mp.size()<<endl;
  // for(int i = 1; i <= n; i++) {
  //   for (int j = 1; j <= m; ++j) {
  //     cout<<mp[make_pair(i, j)]<<" ";
  //   }
  //   cout<<endl;
  // }
  // cout<<nowPos.first<<nowPos.second<<endl;
  // 从当前位置开始遍历
  qe.push(nowPos);
  nowMax = mp[nowPos];

  // 遍历四周
  while(!qe.empty()) {
    pii pr = qe.front();
    qe.pop();
    seeAround(pr);
  }
  cout<<nowMax<<endl;
  return 0;
}

