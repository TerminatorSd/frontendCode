/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2019-08-26 23:12:04
 * @Description: event emitter
 **/
 
function Emt() {
  this._bus = {};

  this.emit = function(str, obj) {
    var funList = this._bus[str];
    if(funList.length) {
      for(var i = 0; i < funList.length; i++) {
        funList[i](obj);
      }
    }
  }

  this.on = function(str, fn) {
    var fnList = this._bus[str] || [];
    fnList.push(fn);
    if(str) {
      this._bus[str] = fnList;
    }
  }
}

var emt = new Emt();

emt.on('haha', function(obj) {
  console.log('haha1: ' + obj.key);
})

emt.on('haha', function(obj) {
  console.log('haha2: ' + obj.key);
}) 

setTimeout(function() {
  emt.emit('haha', {
    key: 'adf',
    value: 'adfsa'
  })
}, 1000)