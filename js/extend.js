/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-31 03:37:38
 * @modify date 2018-08-31 03:37:38
 * @desc 继承
*/

function Animal (name) {
  this.name = name;
  this.sleep = function(){
    console.log(this.name + ' is sleeping');
  }
}
Animal.prototype.eat = function() {
  console.log(this.name + ' is eating');
}

// 原型继承
function Cat(){ }
Cat.prototype = new Animal();
Cat.prototype.name = 'cat';
var cat = new Cat();
cat.sleep();
cat.eat();

// 构造函数继承
function Cat(name){
  Animal.call(this);
  this.name = name || 'Tom';
}
// test code
var cat = new Cat('cat');
cat.eat();  // error
cat.sleep(); 

// 实例继承
function Cat(name){
  var instance = new Animal();
  instance.name = name;
  return instance;
}
// test code
var cat = new Cat('cat');
console.log(cat.name);
cat.eat();
cat.sleep();

// 拷贝继承
function Cat(name){
  var animal = new Animal();
  for(var p in animal){
    Cat.prototype[p] = animal[p];
  }
  Cat.prototype.name = name;
}

// Test Code
var cat = new Cat('cat');
console.log(cat.name);
cat.eat();
cat.sleep();

// 组合继承
// function Cat(name){
//   Animal.call(this);
//   this.name = name;
// }
// Cat.prototype = new Animal();

// // 感谢 @学无止境c 的提醒，组合继承也是需要修复构造函数指向的。

// Cat.prototype.constructor = Cat;

// // Test Code
// var cat = new Cat();
// console.log(cat.name);
// cat.eat();
// cat.sleep();

// 寄生组合继承
function Cat(name){
  Animal.call(this);
  this.name = name;
}
(function(){
  // 创建一个没有实例方法的类
  var Super = function(){};
  Super.prototype = Animal.prototype;
  //将实例作为子类的原型
  Cat.prototype = new Super();
})();
Cat.prototype.constructor = Cat;
// test code
var cat = new Cat();
console.log(cat.name);
cat.eat();
cat.sleep();