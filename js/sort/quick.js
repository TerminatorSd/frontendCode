/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-29 11:28:21
 * @modify date 2018-08-29 11:28:21
 * @desc 快速排序
 *       时间复杂度：平均和最好情况为O(NlogN),最坏情况为O(n 方)
 *       空间复杂度：O(longN)
 *       不稳定
*/

var arr=[3,44,38,5,47,15,36,26,27,2,46,4,19,50,48];

function quickSort(arr, left, right) {
  if(left >= right) {
    return;
  }
  var base = arr[left],
      i = left,
      j = right,
      temp;
  while(i < j) {
    // 从右边找到第一个小于基数的数
    while(arr[j] >= base && i < j) {
      j--;
    }
    // 从左边找到第一个大于基数的数
    while(arr[i] <= base && i < j) {
      i++;
    }
    // 交换位置
    if(i < j) {
      temp = arr[i]; arr[i] = arr[j]; arr[j] = temp;
    }
  }
  // 交换基数与下标i 的位置
  arr[left] = arr[i];
  arr[i] = base;
  quickSort(arr, left, i - 1);
  quickSort(arr, i + 1, right);
}

quickSort(arr, 0, arr.length - 1);
console.log(arr);
