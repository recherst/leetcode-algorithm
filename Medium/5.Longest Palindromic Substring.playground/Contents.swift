/**
 Given a string s, return the longest palindromic substring in s.

  

 Example 1:
 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 
 Example 2:
 Input: s = "cbbd"
 Output: "bb"
  

 Constraints:
 - 1 <= s.length <= 1000
 - s consist of only digits and English letters.
 */
class Solution {
    private var leftPosition = 0
    private var rightPosition = 0
    private var maxLength = 0
    func longestPalindrome(_ s: String) -> String {
        let characterArr = s.map { $0 }
        for i in 0..<s.count {
            var index1 = i
            var index2 = i
            findPalindrome(characterArr, leftPosition: &index1, rightPosition: &index2)
            var index3 = i
            var index4 = i + 1
            findPalindrome(characterArr, leftPosition: &index3, rightPosition: &index4)
        }
        return String(s[s.index(s.startIndex, offsetBy: leftPosition)...s.index(s.startIndex, offsetBy: rightPosition)])
    }
    
    private func findPalindrome(_ s: [Character], leftPosition left: inout Int, rightPosition right: inout Int) {
        let n = s.count
        while left >= 0 && right < n && s[left] == s[right] {
            if right - left + 1 > maxLength {
                leftPosition = left
                rightPosition = right
                maxLength = right - left + 1
            }
            left -= 1
            right += 1
        }
    }
}

let s = Solution()
let r = s.longestPalindrome(
    "lphbehiapswjudnbcossedgioawodnwdruaaxhbkwrxyzaxygmnjgwysafuqbmtzwdkihbwkrjefrsgjbrycembzzlwhxneiijgzidhngbmxwkhphoctpilgooitqbpjxhwrekiqupmlcvawaiposqttsdgzcsjqrmlgyvkkipfigttahljdhtksrozehkzgshekeaxezrswvtinyouomqybqsrtegwwqhqivgnyehpzrhgzckpnnpvajqevbzeksvbezoqygjtdouecnhpjibmsgmcqcgxwzlzztdneahixxhwwuehfsiqghgeunpxgvavqbqrelnvhnnyqnjqfysfltclzeoaletjfzskzvcdwhlbmwbdkxnyqappjzwlowslwcbbmcxoiqkjaqqwvkybimebapkorhfdzntodhpbhgmsspgkbetmgkqlolsltpulgsmyapgjeswazvhxedqsypejwuzlvegtusjcsoenrcmypexkjxyduohlvkhwbrtzjnarusbouwamazzejhnetfqbidalfomecehfmzqkhndpkxinzkpxvhwargbwvaeqbzdhxzmmeeozxxtzpylohvdwoqocvutcelgdsnmubyeeeufdaoznxpvdiwnkjliqtgcmvhilndcdelpnilszzerdcuokyhcxjuedjielvngarsgxkemvhlzuprywlypxeezaxoqfges")
print(r)
