/*
 * Look and Say Sequence
 *
 * J. Hollingsworth & class
 */

func lookAndSay(inSequence sequence: String) -> String {
    // base case
    if sequence.isEmpty {
        return ""
    }
    
    // general case
    var count = 0
    let fixedDigit = sequence[sequence.startIndex]
    
    for digit in sequence.characters {
        if fixedDigit == digit {
            count = count + 1
        } else {
            break
        }
    }
    
    let newDigits = "\(count)\(fixedDigit)"
    
    let start = sequence.index(sequence.startIndex, offsetBy: count)
    let range = start..<sequence.endIndex
    
    return newDigits + lookAndSay(inSequence: sequence[range])
}

let howManyLines = 12
var sequence = "1"
print(sequence)

for _ in 1...howManyLines {
    var newSequence = ""
    newSequence = lookAndSay(inSequence: sequence)
    print(newSequence)
    sequence = newSequence
}
