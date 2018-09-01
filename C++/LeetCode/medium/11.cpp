/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-31 08:30:01
 * @modify date 2018-08-31 08:30:01
 * @desc 给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。
 *       找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
*/
#include <iostream>
#include <vector>

using namespace std;

int maxArea(vector<int>& height) {
    int max = 0, temp;
    for(vector<int>::iterator it = height.begin(); it != height.end(); it++) {
        for(vector<int>::iterator it2 = it + 1; it2 != height.end(); it2++) {
            // vector 中获取当前是第几个元素时用distance 方法
            temp = (distance(height.begin(), it2) - distance(height.begin(), it)) * ((*it) > (*it2) ? (*it2) : (*it));
            if (temp > max) {
                max = temp;
            }
        }
    }
    return max;
}

int main(int argc, char const *argv[])
{
    int arr[] = {1, 8, 6, 2, 5, 4, 8, 3, 7};
    vector<int> arrVec(arr, arr+9);

    int res = maxArea(arrVec);
    cout<<res<<endl;
    return 0;
}


