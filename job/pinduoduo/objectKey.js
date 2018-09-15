/**
 @Author:   shaoDong
 @Version:  1.0
 @DateTime: 2018-08-05 19:58:36
 @Description: es5 不能使用对象作为键值，es6 可以，但是需要使用Map 自身的api 进行操作
**/

var a = new Map();
b = {key: 'b'};
c = {key: 'c'};
// a[b] = 123;
// a[c] = 456;

// console.log(a[b]);
a.set(b, 123);
a.set(c, 456);

console.log(a.get(b));