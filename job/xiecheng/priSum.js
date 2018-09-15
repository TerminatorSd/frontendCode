/**
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-09-04 19:33:28
 * @Description: 对数组质数项求和
 **/
 
// input
var n = 5;
// init arr
var arr = [0, 1, 3, 5, 7];
for(var i = 0; i < n; i++) {
    var num = i + ((i - 1) > 0 ? i - 1 : 0);
    arr.push(num);
}
// 判断一个数是否是质数
function isPri(num) {
    for(var i = 2; i < num; i++) {
        if(num % i === 0) {
            return false;
        }
    }
    return true;
}
// 求和
var sum = 0;
for(var i = 0; i < n; i++) {
    if(isPri(arr[i])) {
        sum += arr[i];
    }
}
console.log(sum);