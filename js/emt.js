/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2019-08-26 23:12:04
 * @Description: event emitter
 **/
 
function Emt() {
  this._events = {};
  this._eventsCount = 0;
  this._maxListenerNum = 10;

  // emit 用来触发事件，会去执行之前用on 注册的方法
  this.emit = function(type, obj) {
    var funList = this._events[type];
    if(funList.length) {
      for(var i = 0; i < funList.length; i++) {
        funList[i](obj);
      }
    }
    return this;
  }

  // on 用来进行订阅，指定事件触发的时候要调用什么方法，可以是一个数组
  this.on = function(type, fn) {
    if(!type || Object.keys(this._events).length >= this._maxListenerNum) {
      type ? console.log('Warning: 超过maxListener 限制') : console.log('Warning: type 不能为空')
      return this;
    }
    var fnList = this._events[type] || [];
    fnList.push(fn);
    this._eventsCount++;
    this._events[type] = fnList;
    return this;
  }

  // 删除绑定在某个type 上的某个fn
  // removeListener 对函数的判断是地址要相同
  //     所以要移除的必须是同一个函数，如果是两个完全相同的匿名函数是不行的
  this.removeListener = function(type, fn) {
    if(fn === undefined) {
      this._events[type] && delete this._events[type]
    } else {
      for (var i = this._events[type].length - 1; i >= 0; i--) {
        if(this._events[type][i] === fn) {
          this._events[type].splice(i, 1);
        }
        this._events[type].length === 0 && delete this._events[type];
      }
    }
    return this;
  }

  // once 是指一次性注册，nodejs 中该函数的实现方式是通过调用on 来实现的
  this.once = function(type, fn) {

  }
}

var emt = new Emt();

function test1Fn(obj) {
  console.log('test1: ' + obj.key);
}

emt.on('test', test1Fn)

emt.on('test', function(obj) {
  console.log('test2: ' + obj.key);
}) 

setTimeout(function() {
  emt.emit('test', {
    key: 'adf',
    value: 'adfsa'
  })
}, 1000)

setTimeout(function() {
  emt.removeListener('test', test1Fn)
}, 2000)


setTimeout(function() {
  emt.emit('test', {
    key: '3s later',
    value: 'adfsa'
  })
}, 3000)


