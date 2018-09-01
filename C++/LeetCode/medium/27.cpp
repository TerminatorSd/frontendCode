/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-31 09:03:13
 * @modify date 2018-08-31 09:03:13
 * @desc 给定一个数组 nums 和一个值 val，你需要原地移除所有数值等于 val 的元素，返回移除后数组的新长度。
         不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
         元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
*/

#include <iostream>
#include <vector>

using namespace std;
int removeElement(vector<int>& nums, int val) {
    int len = nums.size();
    int j = 0;
    // 双指针，一个不停地走，一个遇到不为val 的值才走，不停走的那个遇到不为val 的值就交换
    for(int i = 0; i < len; i++) {
        if(nums[i] != val) {
            nums[j] = nums[i];
            j++;
        }
    }
    return j;
}

int main(int argc, char const *argv[])
{
    int arr[] = {0,1,2,2,3,0,4,2};
    vector<int> arrVec(arr, arr+8);
    int len = removeElement(arrVec, 2);
    cout<<len<<endl;
    return 0;
}
