/*
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-07-20 20:03:30
 * @Description: 连续五次IEEF 输出数字
 */

// 0 1 2 3 4
for(var i = 0; i < 5; i++) {
  (function (i) {
    setTimeout(() => {
      console.log(i);
    }, 1000)
  })(i);
}

// 5 5 5 5 5
var obj = {};
for(obj.j = 0; obj.j < 5; obj.j++) {
  (function (i) {
    setTimeout(() => {
      console.log(obj.j);
    }, 1000)
  })(JSON.parse(JSON.stringify(obj)));
}

