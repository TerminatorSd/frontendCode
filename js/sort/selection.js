/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-29 11:13:31
 * @modify date 2018-08-29 11:13:31
 * @desc 选择排序
 *       时间复杂度：最好、最坏、平均都是n 方
 *       空间复杂度：1
 *       不稳定
*/

var arr=[3,44,38,5,47,15,36,26,27,2,46,4,19,50,48];

function selectionSort(arr) {
  var len = arr.length;
  for(var i = 0; i < len; i++) {
    var minIndex = i;
    for(var j = i + 1; j < len; j++) {
      if(arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    var temp = arr[i];
    arr[i] = arr[minIndex];
    arr[minIndex] = temp;
  }
  return arr;
}

console.log(selectionSort(arr));
