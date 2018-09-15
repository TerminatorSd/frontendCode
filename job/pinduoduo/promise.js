/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-08-05 21:49:23
 * @Description: promise resolve
 **/

function promise() {
  return new Promise(function(resolve, reject) {
    console.log('a');
    resolve();
    console.log('b');
  })
}
var pro = new promise();
pro.then(function (argument) {
 console.log('c');
})
console.log('d');

// a, b, d, c
