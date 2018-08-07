
 // @Author:   shaoDong
 // @Version:  1.0
 // @DateTime: 2018-07-20 19:54:36
 // @Description: 如何判断一个js 变量是不是数组

var arr = [1, 2, 3];
var arr2 = new Array();

// 失败，返回object
console.log(typeof(arr));

// 父子页面之间无法判断
console.log(arr instanceof Array);
// console.log(Object.type(arr) == 'array');

// 通用方法
// console.log(Object.prototype.toString.call(arr).slice(8, -1).toLowerCase() = 'array');