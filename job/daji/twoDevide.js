function twoDevide(arr, start, end, val) {

  if (start > end) {
    return -1;
  }

  let med = Math.floor((start + end) / 2);
  if (arr[med] == val) {
    return med;
  } else if (arr[med] > val) {
    twoDevide(start, med - 1);
  } else {
    twoDevide(med + 1, end);
  }
}

let arr = [1,2,3,4,5,6];
let res = twoDevide(arr, 0, arr.length - 1, 7);
console.log(res);
