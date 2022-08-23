/**
 You are given a string s representing an attendance record for a student where each character signifies whether the student was absent, late, or present on that day. The record only contains the following three characters:

 - 'A': Absent.
 - 'L': Late.
 - 'P': Present.
 
 The student is eligible for an attendance award if they meet both of the following criteria:

 - The student was absent ('A') for strictly fewer than 2 days total.
 - The student was never late ('L') for 3 or more consecutive days.
 
 Return true if the student is eligible for an attendance award, or false otherwise.

  

 Example 1:
 Input: s = "PPALLP"
 Output: true
 Explanation: The student has fewer than 2 absences and was never late 3 or more consecutive days.
 
 Example 2:
 Input: s = "PPALLL"
 Output: false
 Explanation: The student was late 3 consecutive days in the last 3 days, so is not eligible for the award.
  

 Constraints:
 - 1 <= s.length <= 1000
 - s[i] is either 'A', 'L', or 'P'.
 */
class Solution {
    func checkRecord(_ s: String) -> Bool {
        if s.count == 1 { return true }
        var absentCount = 0
        var lateCount = 0
        for (i, c) in s.enumerated() {
            if absentCount == 2 || lateCount == 3 {
                return false
            }
            if c == "A" {
                absentCount += 1
            } else if c == "L" {
                if i == 0 {
                    lateCount += 1
                } else {
                    if s[s.index(s.startIndex, offsetBy: i - 1)] == "L" {
                        lateCount += 1
                    } else {
                        lateCount = 1
                    }
                }
            }
        }
        if absentCount == 2 || lateCount == 3 {
            return false
        }
        return true
    }
}

let s = Solution()
let r = s.checkRecord("LALL")
print(r)
