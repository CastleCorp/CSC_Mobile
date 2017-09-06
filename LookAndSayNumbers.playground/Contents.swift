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
    
    
    return ""
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