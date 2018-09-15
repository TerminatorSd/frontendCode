/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-09-07 18:34:43
 * @Description: des
 **/

// 请使用 JavaScript 实现名为 flatten(input) 的函数，可以将传入的 input 对象（Object 或者 Array）进行扁平化处理
// 并返回结果。具体效果如下：
var input = {
    a: 1,
    b: [ 1, 2, { c: true, d:[1, 2] }, [ 3 ] ],
    d: { e: 2, f: 3 },
    g: null,
    h: {j: 2, k: [1, 2, {l: false}]}
};
// var input = [
//   1,
//   [ 1, 2, { c: true }, [ 3 ] ],
//   { e: 2, f: 3 },
//   null,
//   {j: 2, k: [1, 2, {l: false}]}
// ];
// // 返回
// {
//     "a": 1,
//     "b[0]": 1,
//     "b[1]": 2,
//     "b[2].c": true,
//     "b[3][0]": 3,
//     "d.e": 2,
//     "d.f": 3,
//     // "g": null,  值为null或者undefined，丢弃
// };
var res = {};

flatten(input);

function isArr(arr) {
  return Object.prototype.toString.call(arr).slice(8, -1).toLowerCase() === 'array';
}

function dealWithArr(arr, arrName) {
  for(var i = 0, len = arr.length; i < len; i++) {
    if(isArr(arr[i])) {
      // 如果是数组中的数组则需要加一层[]
      dealWithArr(arr[i], arrName + '[' + i + ']');
    } else if(arr[i] instanceof Object) {
      dealWithObj(arr[i], arrName + '[' + i + '].');
    } else {
      if(arr[i] !== null && arr[i] !== undefined) {
        res[arrName + '[' + i + ']'] = arr[i];
      }
    }
  }
}

function dealWithObj(obj, objName) {
  for(var item in obj) {
    if(isArr(obj[item])) {
      dealWithArr(obj[item], objName + item);
    } else if(obj[item] instanceof Object) {
      dealWithObj(obj[item], objName + item + '.');
    } else {
      if(obj[item] !== null && obj[item] !== undefined) {
        res[objName + '' + item] = obj[item];
      }
    }
  }
}
  
function flatten(input) {
  if(isArr(input)) {
    dealWithArr(input, '');
  } else {
    dealWithObj(input, '');
  }
}

console.log(res);
