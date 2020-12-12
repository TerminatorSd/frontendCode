/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-31 09:07:54
 * @modify date 2018-08-31 09:07:54
 * @desc 使用new 创建的实例中的方法不是引用，也就是说创建多个实例，实例的方法地址是不一样的
*/

function Father(name) {
  this.name = name;
}

Father.prototype.sayHello = function() {
  console.log('hello');
}
// te
// test
var son1 = new Father('son1');
var son2 = new Father('son2');

son1.sayHello();
son2.sayHello();

console.log(son2.constructor === Father.prototype.constructor);
console.log(Object.__proto__ === Function.prototype);

var a = 1;
console.log(Number.prototype.__proto__ === Object.prototype);

// -----------------------
/* 给Person.prototype赋值的是一个对象直接量{getName: function(){}}，
使用对象直接量方式定义的对象其构造器（constructor）指向的是根构造器Object，
Object.prototype是一个空对象{}，{}自然与{getName: function(){}}不等 */

function Person(name) {
  this.name = name
}
console.log(Person.prototype);
// 重写原型
Person.prototype = {
  getName: function() {}
}
console.log(Person.prototype);

var p = new Person('jack')
console.log(p.__proto__ === Person.prototype) // true
console.log(p.__proto__ === p.constructor.prototype) // false

// 原型链
function Dog(name) {
  this.name = name;
}

Dog.prototype.sayWang = function() {
  console.log('旺旺');
}

var dog = new Dog('二哈');
console.log(dog.__proto__ === Dog.prototype);
console.log(dog.__proto__.__proto__ === Object.prototype);
console.log(dog.__proto__.__proto__.__proto__ === null);
// console.log(dog.__proto__.__proto__.__proto__.__proto__ === null);
