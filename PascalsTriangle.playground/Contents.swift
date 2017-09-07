//
//  Pascal'sTriangle
//
//
//  Created by Parker Thomas on 9/6/17.
//
//

import Foundation

func factorial(number n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    return n * factorial(number: n-1)
}

func choose(row n: Int, cell k: Int) -> Int {
    return (factorial(number: n) / (factorial(number: k) * factorial(number: n - k)))
}

// How many rows to generate
let rows = 5

// r stands for row, c stands for c
for r in 0..<rows {
    var currentRow = [Int]()
    var rowString = ""
    
    for c in 0...r {
        currentRow.append(choose(row: r, cell: c))
    }
    
    for i in 0..<currentRow.count {
        rowString = rowString + " " + String(currentRow[i])
    }
    
    print(rowString)
}