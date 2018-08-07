var Father = {name: 'father'};
function Person(name) {
	this.name = name;
	return {name: name};
}

Person.prototype = Father;
var person1 = new Person('Jack');
var person2 = Person('Alice');


// Person.prototype.name = 'haha';
console.log(person1.__proto__);
console.log(person2);
// console.log(person1);
// console.log(person2);
console.log(Person.prototype);
// console.log(JSON.stringify(Person.prototype));
console.log(person1.__proto__ === Person.prototype);
