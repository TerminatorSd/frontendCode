/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-09-07 09:42:46
 * @Description: use of map and reduce
 **/
 
var arr = [1, 3, 5, 7, 9];
var res = arr.reduce((x, y) => {
  return x + y;
});

var resMap = arr.map((x) => {
  return x + 2;
})

arr.forEach((val, index) => {
  arr[index] += 1;
})
console.log(res);
console.log(resMap);
console.log(arr);