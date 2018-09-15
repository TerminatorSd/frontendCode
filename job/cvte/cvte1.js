/*
* @Author: shaoDong
* @Date:   2018-08-10 21:46:14
* @Last Modified by:   sdMac
* @Last Modified time: 2018-08-10 21:50:31
* @Des 寻找数组中和为固定值的两个数字下标
*/

// 方法一
// 因为一开始对数组进行了排序操作
// 所以此方法只能找到和为固定值的两个数字，找不到他们的下标
var arr = [3, 1, 4, 2, 5, 7, 7];

// function twoSum(arr, target) {
//   var res = {};
//   var index = 0;
//   var arrSort = arr.sort();
//   var start = 0,
//       end = arr.length - 1 < target ? arr.length - 1 : target;

//   while(start < end) {
//     var sum = arr[start] + arr[end];
//     if(sum === target) {
//       res[index] = [];
//       res[index].push(start);
//       res[index].push(end);
//       index++;
//       start++;
//       end--;
//     } else if(sum > target) {
//       end--;
//     } else {
//       start++;
//     }
//   }
//   console.log(arrSort);
//   console.log(res);
// };

// 方法二
// 使用对象辅助，克服了方法一的问题，而且时间复杂度更低
// 遍历数组，如果当前元素在目标对象中，则将这两个数字取出并添加到最终结果中
//          如果不存在，则将当前元素添加到目标对象中
function twoSum(arr, target) {
    var obj = {},
        res = {},
        index = 0;
    for(var i = 0, len = arr.length; i < len; i++) {
        var dif = target - arr[i];
        if(dif in obj) {
            res[index] = [];
            res[index].push(obj[dif]);
            res[index].push(i);
            // 这里要记得从对象中删除
            delete obj[dif];
            index++;
        } else {
            obj[arr[i]] = i;
        }
    }
    console.log(res);
};

twoSum(arr, 9);


