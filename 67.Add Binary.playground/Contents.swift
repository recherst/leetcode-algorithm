/**
 Given two binary strings a and b, return their sum as a binary string.

  

 Example 1:
 Input: a = "11", b = "1"
 Output: "100"
 
 Example 2:
 Input: a = "1010", b = "1011"
 Output: "10101"
  

 Constraints:
 - 1 <= a.length, b.length <= 104
 - a and b consist only of '0' or '1' characters.
 - Each string does not contain leading zeros except for the zero itself.
 */
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        guard !a.isEmpty else { return b }
        guard !b.isEmpty else { return a }
        var aArr: [Int] = a.map { $0 == "0" ? 0 : 1 }.reversed()
        var bArr: [Int] = b.map { $0 == "0" ? 0 : 1 }.reversed()
        
        let delta = abs(aArr.count - b.count)
        var carryFlagArr = [Int]()
        var newArr = [String]()
        if delta != 0 {
            if aArr.count > bArr.count {
                for _ in 0..<delta {
                    bArr.append(0)
                }
            } else {
                for _ in 0..<delta {
                    aArr.append(0)
                }
            }
        }
        for i in 0..<aArr.count {
            let aC = aArr[i]
            let bC = bArr[i]
            if i == 0 {
                if aC == 1 && bC == 1 {
                    carryFlagArr.append(1)
                    newArr.append("0")
                } else if aC == 0 && bC == 0 {
                    carryFlagArr.append(0)
                    newArr.append("0")
                } else {
                    carryFlagArr.append(0)
                    newArr.append("1")
                }
            } else {
                let lastFlag = carryFlagArr.last!
                if lastFlag == 1 {
                    if aC == 1 && bC == 1 {
                        carryFlagArr.append(1)
                        newArr.append("1")
                    } else if aC == 0 && bC == 0 {
                        carryFlagArr.append(0)
                        newArr.append("1")
                    } else {
                        carryFlagArr.append(1)
                        newArr.append("0")
                    }
                } else {
                    if aC == 1 && bC == 1 {
                        carryFlagArr.append(1)
                        newArr.append("0")
                    } else if aC == 0 && bC == 0 {
                        carryFlagArr.append(0)
                        newArr.append("0")
                    } else {
                        carryFlagArr.append(0)
                        newArr.append("1")
                    }
                }
            }
        }
        if carryFlagArr.last! == 1 {
            newArr.append("1")
        }
        newArr = newArr.reversed()
        return newArr.joined()
    }
}

let s = Solution()
let r = s.addBinary("1", "111")
print(r)

