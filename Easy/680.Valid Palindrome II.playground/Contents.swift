/**
 Given a string s, return true if the s can be palindrome after deleting at most one character from it.

  

 Example 1:
 Input: s = "aba"
 Output: true
 
 Example 2:
 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 
 Example 3:
 Input: s = "abc"
 Output: false
  

 Constraints:
 - 1 <= s.length <= 10^5
 - s consists of lowercase English letters.
 */
class Solution {
    func validPalindrome(_ s: String) -> Bool {
        if s.count == 2 { return true }
        var left = s.startIndex
        var right = s.index(before: s.endIndex)
        while left < right {
            if s[left] != s[right] {
                return isValid(s: s, i: s.index(after: left), j: right) || isValid(s: s, i: left, j: s.index(before: right))
            }
            left = s.index(after: left)
            right = s.index(before: right)
        }
        return true
    }
    
    private func isValid(s: String, i: String.Index, j: String.Index) -> Bool {
        var i = i
        var j = j
        while i < j {
            if s[i] != s[j] {
                return false
            }
            i = s.index(after: i)
            j = s.index(before: j)
        }
        return true
    }
}

let s = Solution()
let r = s.validPalindrome("aba")
//let r = s.validPalindrome("pvymbhsuhfmqqcmousdmgfpsfbhioftawrhcehxswhgxajeleauwqpkbhwljxblcziicglcygesiggaskejmglzqkwgxbnfnofhfpvlvkzfiumwbbbpasgpedieuwhxzycbanxongjxkjsfftqpvnvkfsqgalfptlpiomsycilvexfdjkviohkdxjuokivnspqmxyjfpbbzhaxgvnwzpaksyjroaexszijygijtdwsfseioxhcxcbacvhwehbuqhjjqpjcerebwqhtkdzjxjaturqktwnyhjtmweigayeuyxctodehvgxricizdhmaukuvfxtrmytsiafsbnscbxwrbtmowleoriofsgcsyulwpcbpnbgwlchnujifjxlqohjxnhvrxiejobcifasluxrgotvoiddyazycracvalgmdekgeotpiaajfybvriuxsddwiscershygfsxbjdjnugrfzmiyjycvznwsbdksvwwjwzukpqunjlgsopgvmudrkopnrivuwakynkwztfaabogbehcfwsgdzxiewcgxxahlmkczbycfecykjkmojhyszhmkwhihdlwocaqqaanucuuvpqihufrjtfgvkdwjlvkcvwwrwqdbtexkioyzevykovqysmymltjawkbshigjudglboxlmqhpsbohcjvfiwuqoiiligpihgbroruftlonxjfmuxiazowrcphnrfgcoaykkgthfpwpocrmnfjxigzsxeihxfbefmlppgdgoiitanziwvlidsqcumdichwlgjzxpozxslaqkulwrhujmmkwoayttytfostbjalehlwbrhfpygfqfyixpaejtfkbfiggjuxgiitpityggriqjkljmcceeeiqtferokqoeekrfjvihjllcsmviwwoxlnnimsdzihgrgosymoyswxqbdkynvfpteyloxbzdzftyygicjchfsdozoobjyesvgcennjtnjmoyrvrpwimlaqfjjfqalmiwprvryomjntjnnecgvseyjboozodsfhcjcigyytfzdzbxolyetpfvnykdbqxwsyomysogrghizdsminnlxowwivmsclljhivjfrkeeoqkoreftqieeeccmjlkjqirggytiptiigxujggifbkftjeapxiyfqfgypfhrbwlhelajbtsoftyttyaowkmmjuhrwlukqalsxzopxzjglwhcidmucqsdilvwiznatiiogdgpplmfebfxhiexszgixjfnmrcopwpfhtgkkyaocgfrnhpcrwozaixumfjxnoltfurorbghipgiliioquwifvjchobsphqmlxoblgdujgihsbkwajtlmymsyqvokyvezyoikxetbdqwrwwvckvljwdkvgftjrfuhiqpvuucunaaqqacowldhihwkmhzsyhjomkjkycefcybzckmlhaxxgcweixzdgswfchebgobaaftzwknykawuvirnpokrdumvgposgljnuqpkuzwjwwvskdbswnzvcyjyimzfrgunjdjbxsfgyhsrecsiwddsxuirvbyfjaaiptoegkedmglavcarcyzayddiovtogrxulsaficbojeixrvhnxjhoqlxjfijunhclwgbnpbcpwluyscgsfoiroelwomtbrwxbcsnbsfaistymrtxfvukuamhdzicirxgvhedotcxyueyagiewmtjhynwtkqrutajxjzdkthqwberecjpqjjhqubhewhvcabcxchxoiesfswdtjigyjizsxeaorjyskapzwnvgxahzbbpfjyxmqpsnvikoujxdkhoivkjdfxevlicysmoipltpflagqsfkvnvpqtffsjkxjgnoxnabcyzxhwueidepgsapbbbwmuifzkvlvpfhfonfnbxgwkqzlgmjeksaggisegyclgciizclbxjlwhbkpqwuaelejaxghwsxhechrwatfoihbfspfgmdsuomcqqmfhushbmyvps")
print(r)
