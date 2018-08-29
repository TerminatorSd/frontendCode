#include <iostream>
#include <vector>

using namespace std;

int main() {
    int lenA = 0;
    int lenB = 0;
    int temp = 0;
    std::vector<int> vecA;
    std::vector<int> vecB;

    cin>>lenA>>lenB;
    for(int i = 0; i < lenA; i++) {
      cin>>temp;
      vecA.push_back(temp);
    }
    for(int i = 0; i < lenB; i++) {
      cin>>temp;
      vecB.push_back(temp);
    }

    cout<<lenA<<" "<<lenB<<endl;
}