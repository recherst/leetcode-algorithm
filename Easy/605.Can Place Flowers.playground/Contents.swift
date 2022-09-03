/**
 You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.

  

 Example 1:
 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: true
 
 Example 2:
 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false
  

 Constraints:
 - 1 <= flowerbed.length <= 2 * 104
 - flowerbed[i] is 0 or 1.
 - There are no two adjacent flowers in flowerbed.
 - 0 <= n <= flowerbed.length
 */
class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        if n == 0 { return true }
        if flowerbed.count == 1 {
            if flowerbed[0] == 0 && n == 1 {
                return true
            } else {
                return false
            }
        }
        var count = n
        var newFlowerbed = flowerbed
        for (i, e) in newFlowerbed.enumerated() {
            if i == 0 {
                if e == 0 && newFlowerbed[i + 1] == 0 {
                    if count > 0 {
                        count -= 1
                        newFlowerbed.replaceSubrange(i..<i + 1, with: repeatElement(1, count: 1))
                    }
                    if count == 0 {
                        return true
                    }
                }
            } else if i > 0 && i < newFlowerbed.count - 1 {
                if e == 0 && newFlowerbed[i + 1] == 0 && newFlowerbed[i - 1] == 0 {
                    if count > 0 {
                        count -= 1
                        newFlowerbed.replaceSubrange(i..<i + 1, with: repeatElement(1, count: 1))
                    }
                    if count == 0 {
                        return true
                    }
                }
            } else {
                if e == 0 && newFlowerbed[i - 1] == 0 {
                    if count > 0 {
                        count -= 1
                        newFlowerbed.replaceSubrange(i..<i + 1, with: repeatElement(1, count: 1))
                    }
                    if count == 0 {
                        return true
                    }
                }
            }
        }
        if count > 0 { return false }
        return false
    }
}

let s = Solution()
let r = s.canPlaceFlowers([0], 1)
print(r)
