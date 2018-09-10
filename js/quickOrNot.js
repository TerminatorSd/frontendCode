function partition(arr, n, k) {
  var i, j, t;
  i = 1;
  j = n;
  t = arr[1];
  while(i < j) {
    while(i < j && arr[j] >= t) {
      j -= 1;
    }
    if(i < j) {
      arr[i] = arr[j];
      i += 1;
    }
    while(i < j && arr[i] <= t) {
      i += 1;
    }
    if(i < j) {
      arr[j] = arr[i];
      j -= 1;
    }
  }
  k = i;
  arr[k] = t;
}

var arr = [0, 3, 1, 6, 2, 4, 5];
var k;
partition(arr, 5, k);
console.log(arr);
