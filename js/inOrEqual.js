
// equal is better than in
var num = 6;
var now = Date.parse(new Date());
for(var i = 0; i < 100000000; i++) {
  if(num in {5: true, 6: true}) {
    var some = 0;
  }
} 
var now2 = Date.parse(new Date());
console.log(now2 - now);

var now3 = Date.parse(new Date());
for(var i = 0; i < 100000000; i++) {
  if(num == 5 || num == 6) {
    var some = 0;
  }
} 
var now4 = Date.parse(new Date());
console.log(now3 - now4);