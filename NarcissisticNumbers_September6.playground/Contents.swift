import Foundation


func isNarcissistic(aNumber number: Int) -> Bool {
    let numberString = String(number)
    let exponent = numberString.characters.count
    var myNumber = number
    
    var sum = 0.0
    while myNumber > 0 {
        let digit = myNumber % 10
        sum = sum + pow(Double(digit), Double(exponent))
        myNumber = myNumber / 10
    }
    
    if number == Int(sum){
        return true
    }
    return false
}

let possibleRange = 1...10000

for number in possibleRange {
    if isNarcissistic(aNumber: number) {
        print(number)
    }
}