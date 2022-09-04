/**
 You are given an integer array nums consisting of n elements, and an integer k.

 Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

  

 Example 1:
 Input: nums = [1,12,-5,-6,50,3], k = 4
 Output: 12.75000
 Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
 
 Example 2:
 Input: nums = [5], k = 1
 Output: 5.00000
  

 Constraints:
 - n == nums.length
 - 1 <= k <= n <= 105
 - -104 <= nums[i] <= 104
 */
class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        if nums.count == 1 && k == 1 { return Double(nums[0]) }
        var max = Int.min
        for i in 0...(nums.count - k) {
            let sum = nums[i..<(i + k)].reduce(0, +)
            if sum > max {
                max = sum
            }
        }
        return (Double(max) * 100000 / Double(k)).rounded() / Double(100000)
    }
}

let s = Solution()
let r = s.findMaxAverage([8860,-853,6534,4477,-4589,8646,-6155,-5577,-1656,-5779,-2619,-8604,-1358,-8009,4983,7063,3104,-1560,4080,2763,5616,-2375,2848,1394,-7173,-5225,-8244,-809,8025,-4072,-4391,-9579,1407,6700,2421,-6685,5481,-1732,-8892,-6645,3077,3287,-4149,8701,-4393,-9070,-1777,2237,-3253,-506,-4931,-7366,-8132,5406,-6300,-275,-1908,67,3569,1433,-7262,-437,8303,4498,-379,3054,-6285,4203,6908,4433,3077,2288,9733,-8067,3007,9725,9669,1362,-2561,-4225,5442,-9006,-429,160,-9234,-4444,3586,-5711,-9506,-79,-4418,-4348,-5891], 93)
print(r)
