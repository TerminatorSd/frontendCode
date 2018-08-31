/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-31 11:29:48
 * @modify date 2018-08-31 11:29:48
 * @desc 闭包
*/

// 阮一峰第一题
// var name = "The Window";
// var object = {
//   name : "My Object",
//   getName : function() {
//     return function() {
//       return this.name;
//     };
//   }
// };
// console.log(object.getName()());

// 阮一峰第二题
// var name = "The Window";
// var object = {
//   name : "My Object",
//   getName : function() {
//     var that = this;
//     return function() {
//       return that.name;
//     };
//   }
// };
// console.log(object.getName()());

// 不带var 相当于声明在global 上
// this.name = 'The Window';
// console.log(module.exports);  // { name: 'The Window' }
// // name = 'The Window';  // global.name = 'The Window'
// var object = {
//   name : 'My Object',
//   getName : function() {
//     return function() {
//       return this.name;
//     };
//   }
// };
// console.log(object.getName()());
// console.log(global.name);

// str = "window";
// console.log(this.str); //window
// var test = {
// 	str: "test",
// 	intest: function() {
// 		console.log(this); //[object Object]
// 		console.log(this.str); //test
// 		return function() {
// 			// console.log(this); //[object Window]
// 			console.log(this.str); //window
// 			var test2 = {
// 				str: "test2",
// 				intest2: function() {
// 					console.log(this); //[object Window]
// 					console.log(this.str); //test2
// 				}
// 			}
// 			test2.intest2();
// 		};
// 	}
// }
// test.intest()();

// 带new 和不带new 的区别
str = 'window';
console.log(this); //window
var test = function() {
  this.str = 'inner';
  console.log(this  === global);
	// console.log(this); //[object Object]
	// console.log(this.str); //test
	// console.log(str); //window
	intest = function() {
		// this.str = "intest";
		// console.log(this); //[object Window]
		console.log(this.str); //intest
	}
}

new test();