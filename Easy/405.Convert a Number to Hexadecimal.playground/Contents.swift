/**
 Given an integer num, return a string representing its hexadecimal representation. For negative integers, two’s complement method is used.

 All the letters in the answer string should be lowercase characters, and there should not be any leading zeros in the answer except for the zero itself.

 Note: You are not allowed to use any built-in library method to directly solve this problem.

  

 Example 1:
 Input: num = 26
 Output: "1a"
 
 Example 2:
 Input: num = -1
 Output: "ffffffff"
  

 Constraints:
 - -231 <= num <= 231 - 1
 */
class Solution {
    func toHex(_ num: Int) -> String {
        if num == 0 { return "0" }
        let sample = [10: "a", 11: "b", 12: "c", 13: "d", 14: "e", 15: "f"]
        var n = abs(num)
        var x = 0
        while pow(16, x) <= n {
            x += 1
        }
        x -= 1
        var arr = [Int]()
        while x > 0 {
            var s = 15
            while s >= 0 {
                if n >= s * pow(16, x) {
                    n -= s * pow(16, x)
                    arr.append(s)
                    break
                }
                s -= 1
            }
            x -= 1
        }
        arr.append(n)
        
        var res = ""
        if num > 0 {
            for e in arr {
                if e > 9 {
                    let letter = sample[e]!
                    res.append(letter)
                } else {
                    res.append("\(e)")
                }
            }
        } else {
            var count = arr.count - 1
            while count >= 0 {
                if arr[count] != 0 {
                    break
                }
                count -= 1
            }
            for i in 0..<8 {
                if i <= arr.count - 1 {
                    if i >= count {
                        if 16 - arr[i] > 9 {
                            if let letter = sample[16 - arr[i]] {
                                res.append(letter)
                            } else {
                                res.append("0")
                            }
                        } else {
                            res.append("\(16 - arr[i])")
                        }
                    } else {
                        if 15 - arr[i] > 9 {
                            let letter = sample[15 - arr[i]]!
                            res.append(letter)
                        } else {
                            res.append("\(15 - arr[i])")
                        }
                    }
                } else {
                    res.insert("f", at: res.startIndex)
                }
            }
        }
        return res
    }
    
    func pow(_ base: Int, _ power: Int) -> Int {
        if base == 0 { return 0 }
        var res = 1
        for _ in 0..<power {
            res *= base
        }
        return res
    }
}

let s = Solution()
let r = s.toHex(-100000)
print(r)
