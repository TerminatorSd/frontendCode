var twoSum = function(nums, target) {
    let obj = {};
    for(let i = 0, len = nums.length; i < len; i++) {
        let dif = target - nums[i];
        if(dif in obj) {
            let res = [];
            res.push(obj[dif]);
            res.push(i);
            return res;
        } else {
            obj[nums[i]] = i;
        }
    }
};

console.log(twoSum([2, 7, 11, 15], 9));
