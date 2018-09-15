/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-08-05 21:38:20
 * @Description: map and foreach
 **/
 
var a = [1, 2];

var res = a.forEach(function(item, index) {
  return item * 2;
 });

 console.log(res); // undefined


var res = a.map(function (currentVal, index, arr) {
  return currentVal * 2;
})

console.log(res); // [2, 4]