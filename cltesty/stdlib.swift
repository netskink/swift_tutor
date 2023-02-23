//
//  stdlib.swift
//  cltesty
//
//  Created by John F. Davis on 2/23/23.
//

import Foundation

func stdlib_one() {
    // generate random number
    let randomDouble = Double.random(in: 1.0 ... 100.0)
    
    print("randomDoube is \(randomDouble)")
}
