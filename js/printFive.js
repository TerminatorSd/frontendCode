/*
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-07-20 20:03:30
 * @Description: 连续五次IEEF 输出数字
 */

for(var i = 0; i < 5; i++) {
  (function (i) {
    setTimeout(() => {
      console.log(i);
    }, 0)
  })(i);
}

for(var i.j = 0; i.j < 5; i.j++) {
  (function (i) {
    setTimeout(() => {
      console.log(i.j);
    }, 0)
  })(JSON.parse(JSON.stringify(i)));
}

