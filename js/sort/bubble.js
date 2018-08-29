/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-29 10:38:05
 * @modify date 2018-08-29 10:38:05
 * @desc bubble sort 
 *       平均时间复杂度：n 方
 *          最好情况：n
 *          最坏情况：n 方
 *       空间复杂度：1
 *       稳定
*/

var arr=[3,44,38,5,47,15,36,26,27,2,46,4,19,50,48];

function bubbleSort(arr) {
  var len = arr.length;
  var flag = 0;
  for(var i = 0; i < len; i++) {
    for(j = 0; j < len - i - 1; j++) {
      if(arr[j] > arr[j + 1]) {
        flag = 1;
        var temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
    if(flag === 0) {
      break;
    }
  }
  return arr;
}

// 改进算法
function bubbleSortBetter(arr) {
  var i = arr.length - 1;
  while(i > 0) {
    // 每次记录下最后一次交换的位置，下一次的比较只需走到这里
    var pos = 0;
    for(var j = 0; j < i; j++) {
      if(arr[j] > arr[j + 1]) {
        pos = j;
        var temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
    i = pos;
  }
  return arr;
}


console.log(bubbleSortBetter(arr));