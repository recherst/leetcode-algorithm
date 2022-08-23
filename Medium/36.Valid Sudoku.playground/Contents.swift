/**
 Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 1. Each row must contain the digits 1-9 without repetition.
 2. Each column must contain the digits 1-9 without repetition.
 3. Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 
 Note:
 - A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 - Only the filled cells need to be validated according to the mentioned rules.
  

 Example 1:
 Input: board =
 [["5","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: true
 
 Example 2:
 Input: board =
 [["8","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: false
 Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
  

 Constraints:
 - board.length == 9
 - board[i].length == 9
 - board[i][j] is a digit 1-9 or '.'.
 */
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for row in board {
            var set: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            for element in row {
                if element != "." {
                    if set.contains(element) {
                        set.remove(element)
                    } else {
                        return false
                    }
                }
            }
        }
        
        for i in 0..<9 {
            var set: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            for j in 0..<9 {
                let element = board[j][i]
                if element != "." {
                    if set.contains(element) {
                        set.remove(element)
                    } else {
                        return false
                    }
                }
            }
        }
        
        let box1 = [board[0][0], board[0][1], board[0][2], board[1][0], board[1][1], board[1][2], board[2][0], board[2][1], board[2][2]]
        var set1: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for e in box1 {
            if e != "." {
                if set1.contains(e) {
                    set1.remove(e)
                } else {
                    return false
                }
            }
        }
        
        let box2 = [board[0][3], board[0][4], board[0][5], board[1][3], board[1][4], board[1][5], board[2][3], board[2][4], board[2][5]]
        var set2: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for e in box2 {
            if e != "." {
                if set2.contains(e) {
                    set2.remove(e)
                } else {
                    return false
                }
            }
        }
        
        let box3 = [board[0][6], board[0][7], board[0][8], board[1][6], board[1][7], board[1][8], board[2][6], board[2][7], board[2][8]]
        var set3: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for e in box3 {
            if e != "." {
                if set3.contains(e) {
                    set3.remove(e)
                } else {
                    return false
                }
            }
        }
        
        let box4 = [board[3][0], board[3][1], board[3][2], board[4][0], board[4][1], board[4][2], board[5][0], board[5][1], board[5][2]]
        var set4: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for e in box4 {
            if e != "." {
                if set4.contains(e) {
                    set4.remove(e)
                } else {
                    return false
                }
            }
        }
        
        let box5 = [board[3][3], board[3][4], board[3][5], board[4][3], board[4][4], board[4][5], board[5][3], board[5][4], board[5][5]]
        var set5: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for e in box5 {
            if e != "." {
                if set5.contains(e) {
                    set5.remove(e)
                } else {
                    return false
                }
            }
        }
        
        let box6 = [board[3][6], board[3][7], board[3][8], board[4][6], board[4][7], board[4][8], board[5][6], board[5][7], board[5][8]]
        var set6: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for e in box6 {
            if e != "." {
                if set6.contains(e) {
                    set6.remove(e)
                } else {
                    return false
                }
            }
        }
        
        let box7 = [board[6][0], board[6][1], board[6][2], board[7][0], board[7][1], board[7][2], board[8][0], board[8][1], board[8][2]]
        var set7: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for e in box7 {
            if e != "." {
                if set7.contains(e) {
                    set7.remove(e)
                } else {
                    return false
                }
            }
        }
        
        let box8 = [board[6][3], board[6][4], board[6][5], board[7][3], board[7][4], board[7][5], board[8][3], board[8][4], board[8][5]]
        var set8: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for e in box8 {
            if e != "." {
                if set8.contains(e) {
                    set8.remove(e)
                } else {
                    return false
                }
            }
        }
        
        let box9 = [board[6][6], board[6][7], board[6][8], board[7][6], board[7][7], board[7][8], board[8][6], board[8][7], board[8][8]]
        var set9: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for e in box9 {
            if e != "." {
                if set9.contains(e) {
                    set9.remove(e)
                } else {
                    return false
                }
            }
        }
        return true
    }
}
