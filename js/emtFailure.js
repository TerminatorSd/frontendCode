/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2019-08-26 22:15:58
 * @Description: EventEmitter
 **/
function Emt() {
  this._bus = {};

  this.emit = function (str, obj) {
    this._bus[str] = obj;
  }
  // on 是用来订阅，emit 是用来发布的，此处的错误在于搞反了两者的逻辑
  this.on = function (str, fun) {
    if(this._bus[str]) {
      fun(this._bus[str]);
    }
  }
}

var demo = new Emt();

setTimeout(function () {
  demo.emit('haha', {
    key: 'a',
    val: 'b'
  });
}, 1000)



demo.on('haha', function (msg) {
  console.log(msg.key);
});