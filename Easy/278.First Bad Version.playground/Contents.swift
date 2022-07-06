/**
 You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

 You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

  

 Example 1:
 Input: n = 5, bad = 4
 Output: 4
 Explanation:
 call isBadVersion(3) -> false
 call isBadVersion(5) -> true
 call isBadVersion(4) -> true
 Then 4 is the first bad version.
 
 Example 2:
 Input: n = 1, bad = 1
 Output: 1
  

 Constraints:
 - 1 <= bad <= n <= 231 - 1
 */
/**
 Note: In order to pass build, I made a class named `VersionControl` and a function `isBadVersion()` to simulate actual environment. This API is provided when you test your solution at leetcode website.
 */
class VersionControl {
    func isBadVersion(_ version: Int) -> Bool {
        if version >= 2 { return true }
        return false
    }
}

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var count = n
        while count != 0 {
            let flag = isBadVersion(count)
            if flag == false {
                return count + 1
            }
            count -= 1
        }
        return 1
    }
}

let s = Solution()
let r = s.firstBadVersion(2)
print(r)
