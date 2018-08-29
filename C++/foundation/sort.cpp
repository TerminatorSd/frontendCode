#include <iostream>
#include <algorithm>

using namespace std;

#define NUM 3

struct node {
  int a;
  int b;
  double c;
};

bool cmp(node x, node y) {
  if(x.a != y.a) return x.a < y.a;
  if(x.b != y.b) return x.b > y.b;
  return x.c > y.c;
}

int main() {
  node nodeArr[NUM] = {
    {2, 2, 1.2},
    {3, 4, 1.6},
    {2, 3, 1.4}
  };
  sort(nodeArr, nodeArr + NUM, cmp);
  for (int i = 0; i < NUM; i++) {
    cout<<nodeArr[i].a<<" "<<nodeArr[i].b<<" "<<nodeArr[i].c<<endl;
  }
  return 0;
}
