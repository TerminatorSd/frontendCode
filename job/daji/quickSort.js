function quickSort(arr, start, end) {
  if (start > end) {
      return;
  }
  let i = start,
      j = end,
      base = arr[start]; //存放基准数
  while (i < j) {
      // 从右边开始，找第一个小于基准的位置
      while (arr[j] >= base && i < j) {
          j--;
      }
      // 从左边开始，找第一个大于基准的位置
      while (arr[i] <= base && i < j) {
          i++
      }
      // 交换两个数
      if (i < j) {
          let tmp = arr[i];
          arr[i] = arr[j];
          arr[j] = tmp;
      }
  }
  // 最后把基准数归位
  arr[start] = arr[i];
  arr[i] = base;
  // 递归处理左边
  quickSort(arr, start, i - 1);
  // 递归处理右边
  quickSort(arr, i + 1, end);
}
var arr = [6, 1, 2, 7, 9, 3, 4, 5, 10, 8];
quickSort(arr, 0, arr.length - 1);
console.log(arr);