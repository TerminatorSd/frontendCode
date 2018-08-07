
// 初始值和最终结果
let start = 20;
// 每次剩的空瓶子
let rest = 0;

function recursive (num) {
  if (num == 1 && rest == 0) {
    return 0;
  } else {
    let half = getHalf(num);
    console.log(num + " + re(" + half + ") rest = " + rest);
    console.log(half + rest);
    return num + recursive(half);
  }  
}
  
function getHalf (num) {
  // 上一轮有空瓶剩下
  if (rest == 1) {
    num += 1;
  }
  if (num == 1) {
    return 1;
  } else if (num % 2) {
    // 有空瓶子剩下
    rest = 1;
    return Math.floor(num / 2);
  } else {
    // 没有空瓶子剩下
    rest = 0;
    return num / 2;
  }
}


function getNum (num) {
  let sum = 0;
  sum += Math.floor(num / 2);
  if (num >= 2) {
    return sum + getNum(sum + num % 2);
  } else {
    return 0;
  }
}

console.log(recursive(20));
console.log(20 + getNum(20));
