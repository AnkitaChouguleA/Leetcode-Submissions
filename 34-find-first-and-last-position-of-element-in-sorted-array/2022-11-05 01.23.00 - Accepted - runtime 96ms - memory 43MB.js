/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var searchRange = function(nums, target) 
{
    let lo = 0, hi = nums.length-1, res = [-1,-1];
    while(lo <= hi)
    {
        let m = lo + Math.floor((hi - lo)/2)

        if(nums[m] == target)
        {
            res[0] = m;
            hi = m - 1;
        }
        else if(nums[m] < target)
        {
            lo = m + 1;
        }
        else 
        {
            hi = m - 1;
        }
    }


     lo = 0, hi = nums.length-1, f = -1, l = -1;
    while(lo <= hi)
    {
        let m = lo + Math.floor((hi - lo)/2)

        if(nums[m] == target)
        {
            res[1] = m;
            lo = m + 1;
        }
        else if(nums[m] < target)
        {
            lo = m + 1;
        }
        else 
        {
            hi = m - 1;;
        }
    }

    return res;
}
