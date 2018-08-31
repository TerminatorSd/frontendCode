/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-30 03:56:56
 * @modify date 2018-08-30 03:56:56
 * @desc 希尔排序
*/
var arr=[3,44,38,5,47,15,36,26,27,2,46,4,19,50,48];

function shellSort(arr) {
  var len = arr.length,
      temp,
      // 设定初始增量
      gap = Math.floor(len / 2);
  // 每经过一轮循环，增量缩小一半
  for (gap; gap > 0; gap = Math.floor(gap / 2)) {
    // 在固定增量的每次循环中执行插入排序
    for (var i = gap; i < len; i++) {
      temp = arr[i];
      for (var j = i - gap; j >= 0 && arr[j] > temp; j -= gap) {
        arr[j + gap] = arr[j];
      }
      arr[j + gap] = temp;
    }
  }
  return arr;
}

console.log(shellSort(arr));