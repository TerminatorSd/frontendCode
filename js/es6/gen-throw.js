function* main() {
	var x = yield 'hello world';
	console.log(x);
}

var it = main();
it.next();
try {
	it.throw('oops');
} catch (err) {
	console.log(err);
}
