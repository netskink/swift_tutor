//
//  control.swift
//  cltesty
//
//  Created by John F. Davis on 12/9/22.
//

import Foundation

func control_testy_one() {
    print("------")
    
    // Execution doesn’t continue to the next case,
    // so you don’t need to explicitly break out of
    // the switch at the end of each case’s code.
    
    let vegetable = "red pepper"
    switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":
            print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup.")
    }

}


// You use for-in to iterate over items in a dictionary by
// providing a pair of names to use for each key-value pair.
// Dictionaries are an unordered collection, so their keys
// and values are iterated over in an arbitrary order.
func control_testy_two() {
    print("------")
    
    let interestingNumbers = [
        "Prime": [2, 3, 5, 7, 11, 13],
        "Fibonacci": [1, 1, 2, 3, 5, 8],
        "Square": [1, 4, 9, 16, 25],
    ]
    
    
    // this is modified a few times
    
    var largest_dict: [String:Int] = [:]
    var largest = 0

    for (akey, numbers) in interestingNumbers {
    // for (_, numbers) in interestingNumbers {
        print("akey:numbers \(akey):\(numbers)")
    //    print("_:numbers :\(numbers)")
        largest = 0
        for number in numbers {
            if number > largest {
                largest = number
                largest_dict[akey] = number
            }
        }
    }
    print(largest)
    print("largest_dict = \(largest_dict)")
}


func control_testy_three() {
    print("------")
    
    
    // Use a while loop to repeat.
    
    var n = 2
    while n < 100 {
        n *= 2
    }
    print("n = \(n)")

    var m = 2
    repeat {
        m *= 2
    } while m < 100
    print("m = \(m)")
}


func control_testy_four() {
    print("------")
    
    // use ..< to make a range of indexes
    
    for i in 0..<4 {
        print("i = \(i)")
    }
    
}
