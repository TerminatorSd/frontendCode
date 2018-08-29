#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <map>
#include <list>
#include <algorithm>
 
using namespace std;

int twoPointsFind (std::vector<int> arr, int find) {
  int low = 0;
  int height = arr.size() - 1;
  int mid = 0;
  while(low < height) {
    mid = (low + height) / 2;
    if (arr[mid] == find) {
      return mid;
    } else if (arr[mid] < find) {
      low = mid + 1;
    } else {
      height = mid - 1;
    }
  }
  return -1;
}

int main() {
  int find, n, temp;
  std::vector<int> arr;
  cin>>n;
  for (int i = 0; i < n; i++) {
    cin>>temp;
    arr.push_back(temp);
  }
  cin>>find;
  int res = twoPointsFind(arr, find);
  cout<<res<<endl;
  return 0;
}
