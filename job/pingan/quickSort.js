function bisection(arr) {
  quickSort(arr, 0, arr.length - 1);
  console.log(arr);
}

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

var arr = '[5, 9, 29, 66, 78, 13, 4, 99, 131, 199, 41]';
arr = arr.split('[')[1].split(']')[0].split(', ');
arr.forEach(function(val, index) {
  arr[index] = parseInt(arr[index]);
})
// var arr = [5, 9, 29, 66, 78, 13, 4, 99, 131, 199, 41];

console.log(arr);

bisection(arr);
