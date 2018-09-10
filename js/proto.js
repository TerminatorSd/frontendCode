function Foo(){}
var Boo = {name: 'Boo'};
Foo.prototype = Boo;
var f = new Foo();

console.log(f);
console.log(f.__proto__);
console.log(Foo.prototype);
console.log(f.__proto__ === Foo.prototype);

function Person () {};
var person = new Person();
person.__proto__ === Person.prototype; // true

console.log('================');
function Father() {
	this.a = 'a';
	this.b = 'b';
}

function son() {};
son.prototype = new Father();
console.log(son);
console.log(son.a);

var num = 2;
var arr = [3];
console.log(num instanceof Object);
console.log(arr instanceof Object);
console.log(arr.__proto__ === Number.prototype);

