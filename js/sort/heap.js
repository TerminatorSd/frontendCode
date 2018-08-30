/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-30 10:37:08
 * @modify date 2018-08-30 10:37:08
 * @desc 堆排序
 *       平均时间复杂度：O(NlogN)
 *          最好情况：O(NlogN)
 *          最坏情况：O(NlogN)
 *       空间复杂度：O(1)
 *       不稳定
*/

var arr=[3,44,38,5,47,15,36,26,27,2,46,4,19,50,48];
// var arr = [4, 3, 25, 12, 6, 15, 7];

function heapSort(arr) {
  var heapSize = arr.length;
  // 从倒数第二层开始比较交换至根元素
  for(var i = Math.floor(heapSize / 2) - 1; i >= 0; i--) {
    heapCompare(arr, i, heapSize);
  }

  for(var j = heapSize - 1; j > 0; j--) {
    var temp = arr[0];
    arr[0] = arr[j];
    arr[j] = temp;
    heapCompare(arr, 0, --heapSize);
  }
  return arr;
}

// 当前节点与其左右子节点进行对比，大的向上冒泡
function heapCompare(arr, nowIndex, len) {
  var maxIndex = nowIndex,
      leftChild = 2 * nowIndex + 1,
      rightChild = 2 * nowIndex + 2;
  
  if(leftChild < len && arr[leftChild] > arr[maxIndex]) {
    maxIndex = leftChild;
  }
  if(rightChild < len && arr[rightChild] > arr[maxIndex]) {
    maxIndex = rightChild;
  }
  if(maxIndex != nowIndex) {
    var temp = arr[nowIndex];
    arr[nowIndex] = arr[maxIndex];
    arr[maxIndex] = temp;
    // 每次换完以后检查一下下层是否还有比这个更大的，如果有，要冒泡上来
    heapCompare(arr, maxIndex, len);
  }
}

console.log(heapSort(arr));
