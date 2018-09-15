/*
* @Author: shaoDong
* @Date:   2018-08-10 21:04:22
* @Last Modified by:   sdMac
* @Last Modified time: 2018-08-10 21:47:38
* @Des 螺旋式向内输出5 * 5 的二维数组
*/
function printStr(num) {
      // 最终结果
  var arrObj = {},
      // 转向步数
      changeNum = 5,
      // 转向步数递减标志位
      changeFlag = 1,
      // 目前步数
      nowCount = 0,
      // 控制方向
      directionIndex = -1,
      // 当前坐标
      xy = {
        x: 0,
        y: 0
      },
      // 不同方向的操作，使用策略模式实现
      direction = {
        // down left up right
        '0': function (obj, xy, num) {
          xy.x += 1;
          obj[xy.x][xy.y] = num;
        },
        '1': function (obj, xy, num) {
          xy.y -= 1;
          obj[xy.x][xy.y] = num;
        },
        '2': function (obj, xy, num) {
          xy.x -= 1;
          obj[xy.x][xy.y] = num;
        },
        '3': function (obj, xy, num) {
          xy.y += 1;
          obj[xy.x][xy.y] = num;
        }
      }
  // 初始化数组
  for(var i = 0; i < 5; i++) {
    arrObj[i] = new Array(5);
  }
  // 初始化第一行
  for(var j = 0; j < 5; j++) {
    arrObj[xy.x][xy.y++] = num + j;
    nowCount++;
  }
  // 走过了，往回撤一步
  xy.y -= 1;
  // 遍历剩下的数据
  for(var k = num + j; k <= 25; k++) {
    if(nowCount === changeNum) {
      // 每两次步数减一
      if(changeFlag) {
        changeFlag = 0;
        changeNum--;
      } else {
        changeFlag = 1;
      }
      // 轮流变换方向
      directionIndex = (directionIndex + 1) % 4;
      nowCount = 0;
    }
    direction[directionIndex](arrObj, xy, k);
    nowCount++;
  }
  // 打印
  printWithN(arrObj);
}
// 按行打印
function printWithN(obj) {
  for(var item in obj) {
    console.log(obj[item].join(' '));
  }
}
// 启动函数
printStr(1);
