//
//  Pascal'sTriangle.swift
//
//
//  Created by Parker Thomas on 9/6/17.
//
//

import Foundation

func factorial(number n: Int) -> Int {
    var sum = 1
    for i in 1...n {
        sum = sum * i
    }
    return sum
}

func choose(nNumber n: Int, kNumber k: Int) {
    // compute (n)     n!
    //         (k) = --------
    //               k!(n-k)!
}

print(factorial(number: 5))