/**
 * @author shaoDong
 * @email scut_sd@163.com
 * @create date 2018-08-30 08:42:59
 * @modify date 2018-08-30 08:42:59
 * @desc 
 * 输入:
    var obj = [
      {id: 1, parent: null},
      {id: 2, parent: 1},
      {id: 3, parent: 2}
    ]
 * 输出:
 * { 
      obj:
        { 
          id: 1,
          parent: null,
          child: { 
            id: 2, 
            parent: 1, 
            child: {
              id: 3, 
              parent: 2,
            }
          } 
        } 
      }
    }
 * 
*/

var obj = [
  {id: 1, parent: null},
  {id: 2, parent: 1},
  {id: 3, parent: 2}
]
var obj2 = {};
for(var i = 0; i < obj.length; i++) {
  if(obj[i].parent === null) {
    obj2.obj = obj[i];
    obj.splice(i, 1);
  }
}
// 循环进行直到处理完数组内所有的元素
while(obj.length) {
  for(var i = 0; i < obj.length; i++) {
    var temp = findLayer(obj2, obj[i].parent);
    if(temp) {   
      temp.child = obj[i];
      obj.splice(i, 1);
    }
  }
}
console.log(obj2);
// 找到id 值为parent 的那一层
function findLayer(obj2, parent) { 
  var child = obj2.obj;
  while(child) {
    if(child.id === parent) {
      return child;
    }
    child = child.child;
  }
  return null;
}