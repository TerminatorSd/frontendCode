/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-29 09:13:02
 * @modify date 2018-08-29 09:13:02
 * @desc 归并排序 分而治之
 *       平均时间复杂度：O(NlogN)
 *          最好情况：O(NlogN)
 *          最坏情况：O(NlogN)
 *       空间复杂度：O(N)
 *       稳定
*/

var arr=[3,44,38,5,47,15,36,26,27,2,46,4,19,50,48];

function mergeSort(arr) {
  var len = arr.length;
  if(len < 2) {
    return arr;
  }
  var middle = Math.floor(len / 2);
  var left = arr.slice(0, middle);
  var right = arr.slice(middle);
  return merge(mergeSort(left), mergeSort(right));
}

// 将相邻的两个分组合并为一个分组
function merge(left, right) {
  var res = [];
  while(left.length && right.length) {
    if(left[0] < right[0]) {
      res.push(left.shift());
    } else {
      res.push(right.shift());
    }
  }
  while(left.length) {
    res.push(left.shift());
  }
  while(right.length) {
    res.push(right.shift());
  }
  return res;
}

console.log(mergeSort(arr));
