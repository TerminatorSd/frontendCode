/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-08-05 21:23:08
 * @Description: arguments 个数
 **/
 
function log() {
  // 使用arguments.length 可以获取到输入参数的个数
  // 但是输入参数实际上是以类数组对象形式存储
  // 不能直接调用数组的方法
  // 需要将其装换成数组才行
  let inputArr = Array.prototype.slice.call(arguments);
  var res = '(app)' + inputArr.join(' ');
  console.log(res);
  return res;
}

log('hello wrold');
log('hello', 'wrold');
