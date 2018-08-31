/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-30 04:18:02
 * @modify date 2018-08-30 04:18:02
 * @desc 插入排序
 *       时间复杂度：平均和最坏情况为O(n 方),最好情况为O(n)
 *       空间复杂度：O(1)
 *       稳定
*/
var arr=[3,44,38,5,47,15,36,26,27,2,46,4,19,50,48];

function insertSort(arr) {
  var len = arr.length;
  for(var i = 1; i < len; i++) {
    var temp = arr[i];
    // 从当前元素的前一个开始比较，找到合适的位置插入
    for(var j = i - 1; j >= 0 && arr[j] > temp; j--) {
      // 大于当前元素直接后移
      arr[j + 1] = arr[j];
    }
    arr[j + 1] = temp;
  }
  return arr;
}

console.log(insertSort(arr));