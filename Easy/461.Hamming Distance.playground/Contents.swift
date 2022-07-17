/**
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

 Given two integers x and y, return the Hamming distance between them.

  

 Example 1:
 Input: x = 1, y = 4
 Output: 2
 Explanation:
 1   (0 0 0 1)
 4   (0 1 0 0)
        ↑   ↑
 The above arrows point to positions where the corresponding bits are different.
 
 Example 2:
 Input: x = 3, y = 1
 Output: 1
  

 Constraints:
 - 0 <= x, y <= 231 - 1
 */
class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        if x == y { return 0 }
        var i = 0
        var j = 0
        while pow(2, i) <= x {
            i += 1
        }
        i -= 1
        var r = decimalToBinary(x, maxBit: i)
        
        while pow(2, j) <= y {
            j += 1
        }
        j -= 1
        var t = decimalToBinary(y, maxBit: j)
        r = r.reversed()
        t = t.reversed()
        if r.count < t.count {
            let temp = r
            r = t
            t = temp
        }
        let delta = abs(r.count - t.count)
        if delta > 0 {
            for _ in 0..<delta {
                t.insert(0, at: 0)
            }
        }
        
        var times = 0
        for i in 0..<r.count {
            let e1 = r[i]
            let e2 = t[i]
            if e1 != e2 {
                times += 1
            }
        }
        return times
    }
    
    private func pow(_ base: Int, _ power: Int) -> Int {
        if base == 0 { return 0 }
        var res = 1
        for _ in 0..<power {
            res *= base
        }
        return res
    }
    
    private func decimalToBinary(_ num: Int, maxBit bit: Int) -> [Int] {
        var n = num
        var i = bit
        var arr = Array(repeating: 0, count: bit + 1)
        while i >= 0 && n > 0 {
            while pow(2, i) <= n {
                n -= pow(2, i)
                arr[i] = 1
            }
            i -= 1
        }
        return arr
    }
}

let s = Solution()
let r = s.hammingDistance(333, 654)
print(r)
