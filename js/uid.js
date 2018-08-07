

var uid = 0;

function Dep() {
  this.id = uid++;
}

Dep.prototype.show = function () {
  console.log(this.id);
}

var dep1 = new Dep();
var dep2 = new Dep();
var dep3 = new Dep();

dep1.show();
dep2.show();
dep3.show();