/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-08-05 21:56:20
 * @Description: set 会去重，但是不会排序
 **/

var a = [1, 4, 3, 3, 2];
var b = new Set(a.sort());
console.log(b);