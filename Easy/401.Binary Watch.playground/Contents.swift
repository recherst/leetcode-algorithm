/**
 A binary watch has 4 LEDs on the top to represent the hours (0-11), and 6 LEDs on the bottom to represent the minutes (0-59). Each LED represents a zero or one, with the least significant bit on the right.

 - For example, the below binary watch reads `"4:51"`.


 Given an integer turnedOn which represents the number of LEDs that are currently on (ignoring the PM), return all possible times the watch could represent. You may return the answer in **any order**.

 The hour must not contain a leading zero.
 - For example, `"01:00"` is not valid. It should be `"1:00"`.
 
 The minute must be consist of two digits and may contain a leading zero.
 - For example, `"10:2"` is not valid. It should be `"10:02"`.
  

 Example 1:
 Input: turnedOn = 1
 Output: ["0:01","0:02","0:04","0:08","0:16","0:32","1:00","2:00","4:00","8:00"]
 
 Example 2:
 Input: turnedOn = 9
 Output: []
  

 Constraints:
 - 0 <= turnedOn <= 10
 */
class Solution {
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        let hours = ["8", "4", "2", "1"]
        let minites = ["32", "16", "8", "4", "2", "1"]
        var arr = [String]()
        if turnedOn == 0 {
            return ["0:00"]
        } else if turnedOn == 1 {
            for e in hours {
                arr.append("\(e):00")
            }
            for e in minites {
                if e.count == 1 {
                    arr.append("0:0\(e)")
                } else {
                    arr.append("0:\(e)")
                }
            }
        } else if turnedOn == 2 {
            for e1 in hours {
                for e2 in minites {
                    if e2.count == 1 {
                        arr.append("\(e1):0\(e2)")
                    } else {
                        arr.append("\(e1):\(e2)")
                    }
                }
            }
            
            arr.append(contentsOf: twoHours(in: hours).map { "\($0):00" })
            
            arr.append(contentsOf: twoMinites(in: minites).map { "0:\($0)" })
        } else if turnedOn == 3 {
            // Three hours
            arr.append(contentsOf: threeHours(in: hours).map { "\($0):00" })
            
            // Three minites
            let minitesArr = threeMinite(in: minites).map { "0:\($0)" }
            arr.append(contentsOf: Array(Set(minitesArr)))

            // One hour and two minites
            let minitesArr2 = twoMinites(in: minites)
            for h in hours {
                for minite in minitesArr2 {
                    arr.append("\(h):\(minite)")
                }
            }

            // Two hours and one minite
            let hoursArr = twoHours(in: hours)
            for hour in hoursArr {
                for minite in minites {
                    if Int(minite)! >= 10 {
                        arr.append("\(hour):\(minite)")
                    } else {
                        arr.append("\(hour):0\(minite)")
                    }
                }
            }
        } else if turnedOn == 4 {
            // One hour and three minites
            let minitesArr = threeMinite(in: minites)
            for hour in hours {
                for minite in minitesArr {
                    arr.append("\(hour):\(minite)")
                }
            }
            
            // Three hours and one minite
            let hoursArr = threeHours(in: hours)
            for hour in hoursArr {
                for minite in minites {
                    if Int(minite)! >= 10 {
                        arr.append("\(hour):\(minite)")
                    } else {
                        arr.append("\(hour):0\(minite)")
                    }
                }
            }
            
            // Two hours and two minites
            let hoursArr2 = twoHours(in: hours)
            let minitesArr2 = twoMinites(in: minites)
            for hour in hoursArr2 {
                for minite in minitesArr2 {
                    arr.append("\(hour):\(minite)")
                }
            }
            
            // Four minites
            arr.append(contentsOf: fourMinites(in: minites).map { "0:\($0)" })
        } else if turnedOn == 5 {
            // one hour and four minites
            let minitesArr = fourMinites(in: minites)
            for hour in hours {
                for minite in minitesArr {
                    arr.append("\(hour):\(minite)")
                }
            }
            
            // Two hours and three minites
            let hoursArr = twoHours(in: hours)
            let minitesArr2 = threeMinite(in: minites)
            for hour in hoursArr {
                for minite in minitesArr2 {
                    arr.append("\(hour):\(minite)")
                }
            }
            
            // Three hours and two minites
            let hoursArr2 = threeHours(in: hours)
            let minitesArr3 = twoMinites(in: minites)
            for hour in hoursArr2 {
                for minite in minitesArr3 {
                    arr.append("\(hour):\(minite)")
                }
            }
            
            // Five minites
            arr.append(contentsOf: fiveMinites(in: minites).map { "0:\($0)" })
        } else if turnedOn == 6 {
            // one hour and five minites
            let minitesArr = fiveMinites(in: minites)
            for hour in hours {
                for minite in minitesArr {
                    arr.append("\(hour):\(minite)")
                }
            }
            
            // Two hour and four minites
            let hoursArr = twoHours(in: hours)
            let minitesArr2 = fourMinites(in: minites)
            for hour in hoursArr {
                for minite in minitesArr2 {
                    arr.append("\(hour):\(minite)")
                }
            }
            
            // Three hour and three minites
            let hoursArr2 = threeHours(in: hours)
            let minitesArr3 = threeMinite(in: minites)
            for hour in hoursArr2 {
                for minite in minitesArr3 {
                    arr.append("\(hour):\(minite)")
                }
            }
        } else if turnedOn == 7 {
            // Two hours and five minites
            let hoursArr = twoHours(in: hours)
            let minitesArr = fiveMinites(in: minites)
            for hour in hoursArr {
                for minite in minitesArr {
                    arr.append("\(hour):\(minite)")
                }
            }
            
            // Three hours and four minites
            let hoursArr1 = threeHours(in: hours)
            let minitesArr1 = fourMinites(in: minites)
            for hour in hoursArr1 {
                for minite in minitesArr1 {
                    arr.append("\(hour):\(minite)")
                }
            }
        } else if turnedOn == 8 {
            // Three hours and five minites
            let hoursArr = threeHours(in: hours)
            let minitesArr = fiveMinites(in: minites)
            for hour in hoursArr {
                for minite in minitesArr {
                    arr.append("\(hour):\(minite)")
                }
            }
        } else {
            return []
        }
        
        arr = arr.sorted { (e1, e2) -> Bool in
            let item1Arr = e1.split(separator: ":")
            let item2Arr = e2.split(separator: ":")
            if Int(item1Arr.first!)! == Int(item2Arr.first!)! {
                return Int(item1Arr.last!)! < Int(item2Arr.last!)!
            }
            return Int(item1Arr.first!)! < Int(item2Arr.first!)!
        }
        return arr
    }
    
    // MARK: Hours
    
    private func twoHours(in hours: [String]) -> [String] {
        var hoursArr = [String]()
        var hoursCopy = hours
        for e1 in hours {
            let index = hoursCopy.firstIndex(of: e1)!
            hoursCopy.remove(at: index)
            for e2 in hoursCopy {
                let hour = Int(e1)! + Int(e2)!
                if hour < 12 {
                    hoursArr.append("\(hour)")
                }
            }
            hoursCopy = hours
        }
        return Array(Set(hoursArr))
    }
    
    private func threeHours(in hours: [String]) -> [String] {
        var hoursArr = [String]()
        var hoursCopy = hours
        for hour in hours {
            let index = hours.firstIndex(of: hour)!
            hoursCopy.remove(at: index)
            let sumHour = hoursCopy.map { Int($0)! }.reduce(0, +)
            if sumHour < 12 {
                hoursArr.append("\(sumHour)")
            }
            hoursCopy = hours
        }
        return Array(Set(hoursArr))
    }
    
    // MARK: Minites
    
    private func oneMinite(in minites: [String]) -> [String] {
        var minitesArr = [String]()
        for minite in minites {
            if Int(minite)! >= 10 {
                minitesArr.append("\(minite)")
            } else {
                minitesArr.append("0\(minite)")
            }
        }
        return minitesArr
    }
    
    private func twoMinites(in minites: [String]) -> [String] {
        var minitesCopy = minites
        var minitesArr = [String]()
        for e1 in minites {
            let index = minitesCopy.firstIndex(of: e1)!
            minitesCopy.remove(at: index)
            for e2 in minitesCopy {
                if Int(e1)! + Int(e2)! >= 10 {
                    minitesArr.append("\(Int(e1)! + Int(e2)!)")
                } else {
                    minitesArr.append("0\(Int(e1)! + Int(e2)!)")
                }
            }
            minitesCopy = minites
        }
        return Array(Set(minitesArr))
    }
    
    private func threeMinite(in minites: [String]) -> [String] {
        var minitesCopy = minites
        var minitesArr = [String]()
        for e1 in minites {
            let index = minitesCopy.firstIndex(of: e1)!
            minitesCopy.remove(at: index)
            var minitesCopy1 = minitesCopy
            for e2 in minitesCopy {
                let index2 = minitesCopy1.firstIndex(of: e2)!
                minitesCopy1.remove(at: index2)
                for e3 in minitesCopy1 {
                    if Int(e1)! + Int(e2)! + Int(e3)! >= 10 {
                        minitesArr.append("\(Int(e1)! + Int(e2)! + Int(e3)!)")
                    } else {
                        minitesArr.append("0\(Int(e1)! + Int(e2)! + Int(e3)!)")
                    }
                }
            }
            minitesCopy = minites
        }
        return Array(Set(minitesArr))
    }
    
    private func fourMinites(in minites: [String]) -> [String] {
        var minitesCopy = minites
        var minitesArr = [String]()
        for e1 in minites {
            let index = minitesCopy.firstIndex(of: e1)!
            minitesCopy.remove(at: index)
            var miniteCopy1 = minitesCopy
            for e2 in miniteCopy1 {
                let index2 = miniteCopy1.firstIndex(of: e2)!
                miniteCopy1.remove(at: index2)
                let mixedMinite = miniteCopy1.map { Int($0)! }.reduce(0, +)
                if mixedMinite < 60 {
                    if mixedMinite >= 10 {
                        minitesArr.append("\(mixedMinite)")
                    } else {
                        minitesArr.append("0\(mixedMinite)")
                    }
                }
                miniteCopy1 = minitesCopy
            }
            minitesCopy = minites
        }
        return Array(Set(minitesArr))
    }
    
    private func fiveMinites(in minites: [String]) -> [String] {
        var minitesCopy = minites
        var arr = [String]()
        for i in 0..<minites.count {
            minitesCopy.remove(at: i)
            let minite = minitesCopy.map { Int($0)! }.reduce(0, +)
            if minite < 60 {
                if minite >= 10 {
                    arr.append("\(minite)")
                } else {
                    arr.append("0\(minite)")
                }
            }
            minitesCopy = minites
        }
        return arr
    }
}

let s = Solution()
let r = s.readBinaryWatch(4)
print(r)
