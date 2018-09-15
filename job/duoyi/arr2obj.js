/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-09-06 11:37:25
 * @Description: des
 **/
 
var nodes = [
  {id: 10, title: 'dw10', parentId: 4},
  {id: 2, title: 'dw2', parentId: 0},
  {id: 4, title: 'dw4', parentId: 2},
  {id: 12, title: 'dw12', parentId: 2},
  {id: 8, title: 'dw8', parentId: 4}
];

function findPos(obj, id) {
  // 广度优先搜索遍历当前对象
  var queue = [], temp;
  if(obj.id === id) {
    return obj;
  }
  queue.push(obj.children);
  while(queue) {
    temp = queue.shift();
    var res = findChildIndex(id, temp);
    if(res) {
      return res;
    }
    for(var i = 0; i < temp.length; i++) {
      queue.push(temp[i]);
    }
  }
}

// 判断一个数字是否在children 列表内
function findChildIndex(id, arr) {
  if(arr.id && id === arr.id) {
    return arr;
  }
  for(var i = 0; i < arr.length; i++) {
    if(id === arr[i].id) {
      return arr[i];
    }
  }
  return null;
}

// sort
function cmp(a, b) {
  return a.parentId - b.parentId;
}
nodes.sort(cmp);

var resObj = nodes[0];
for(var i = 1, len = nodes.length; i < len; i++) {
  var findRes = findPos(resObj, nodes[i].parentId);
  if(findRes) {
    if(!findRes.children) {
      findRes.children = [];
    }
    findRes.children.push(nodes[i]);
  }
}
console.log(resObj);