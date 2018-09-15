/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-09-06 15:11:54
 * @Description: des
 **/
 
var nodes = [
  {id: 10, title: 'dw10', parentId: 4},
  {id: 2, title: 'dw2', parentId: 0},
  {id: 4, title: 'dw4', parentId: 2},
  {id: 12, title: 'dw12', parentId: 2},
  {id: 8, title: 'dw8', parentId: 4}
];

// sort
function cmp(a, b) {
  return a.parentId - b.parentId;
}
nodes.sort(cmp);

var midObj = {};
// 从后向前遍历
for(var i = nodes.length - 1; i >= 0; i--) {
  var nowPid = nodes[i].parentId;
  var nowId = nodes[i].id;
  // 建立当前节点的父节点的children 数组
  if(midObj[nowPid]) {
    midObj[nowPid].push(nodes[i]);
  } else {
    midObj[nowPid] = [];
    midObj[nowPid].push(nodes[i]);
  }
  // 将children 放入合适的位置
  if(midObj[nowId]) {
    nodes[i].children = midObj[nowId];
    delete midObj[nowId];
  }
}

console.log(midObj[0][0]);