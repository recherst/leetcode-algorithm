/**
 We are playing the Guess Game. The game is as follows:

 I pick a number from 1 to n. You have to guess which number I picked.

 Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.

 You call a pre-defined API int guess(int num), which returns three possible results:

 - `-1`: Your guess is higher than the number I picked (i.e. num > pick).
 - `1`: Your guess is lower than the number I picked (i.e. num < pick).
 - `0`: your guess is equal to the number I picked (i.e. num == pick).
 Return the number that I picked.

  

 Example 1:
 Input: n = 10, pick = 6
 Output: 6
 
 Example 2:
 Input: n = 1, pick = 1
 Output: 1
 
 Example 3:
 Input: n = 2, pick = 1
 Output: 1
  

 Constraints:
 - 1 <= n <= 231 - 1
 - 1 <= pick <= n
 */
/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return          -1 if the picked number is lower than your guess number
 *            1 if the picked number is higher than your guess number
 *            otherwise return 0
 * func guess(_ num: Int) -> Int
 */
/**
 Note: This class is created just for passing builds. The real function is provided by leetcode at https://leetcode.cn.
 */
class GuessGame {
    func guess(_ num: Int) -> Int {
        if num == 1 {
            return 0
        } else if num > 1 {
            return -1
        } else {
            return 1
        }
    }
}
class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var num = n
        var lower = 1
        var higher = num
        while lower <= higher {
            num = (lower + higher) / 2
            let result = guess(num)
            if result == 0 {
                return num
            } else if result == -1 { // higher than the number I picked
                higher = num - 1
            } else if result == 1 { // lower than the number I picked
                lower = num + 1
            }
        }
        return 0
    }
}

let s = Solution()
let r = s.guessNumber(1)
print(r)
