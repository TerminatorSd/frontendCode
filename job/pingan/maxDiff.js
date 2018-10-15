/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-10-15 14:55:45
 * @Description: max diff
 **/
 
function getMaxProfit(arr) {
  var max = 0,
      len = arr.length;
  for(var i = 0; i < len; i++) {
    for(var j = i + 1; j < len; j++) {
      if(abs(arr[i] - arr[j]) > max) {
        max = abs(arr[i] - arr[j]);
      }
    }
  }
  console.log(max);
}

function abs(num) {
  return num > 0 ? num : -num;
}

var arr = [10, 2, 12, 7, 8, 9];
getMaxProfit(arr);