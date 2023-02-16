//
//  generics.swift
//  cltesty
//
//  Created by John F. Davis on 2/16/23.
//

import Foundation

// write a name inside angle brackets to make a generic function or type.

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {

    // delcare a generic empty array
    var result: [Item] = []
    
    for _ in 0..<numberOfTimes {
        result.append(item)
    }

    return result
}

func generics_one() {
    print("--------")

    var result1: [String] = []
    result1 = makeArray(repeating: "knock", numberOfTimes: 4)
    print("result1 is \(result1)")
    
    var result2: [Int] = []
    result2 = makeArray(repeating: 33, numberOfTimes: 4)
    print("result2 is \(result2)")

}


// You can make generic forms of functions and methods, as well as classses,
// enumerations and structures.

// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

func generics_two() {
    print("--------")

    var possibleInteger: OptionalValue<Int> = .none
    possibleInteger = .some(100)

    print("PossibleInteger is \(possibleInteger)")
}



// Use `where` right before the body to specify a list of requirements -- for
// example, to require the type to implement a protocol, to require
// two types to be the same, or to require a class to have a
// particular superclass

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
                        where T.Element: Equatable, T.Element == U.Element {
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
                            
    return false
}

func generics_three() {
    print("--------")

    var result: Bool
    
    result = anyCommonElements([1,2,3], [3])

    print("result is \(result)")
}


// Modify the anyCommonElements(_:_) function to make a function
// that returns an array of the elements that any two sequences have in common

// Writing <T: Equatable> is the same as writing <T> ... where T: Equatable


func anyCommonElements2<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Element]
    where T.Element: Equatable, T.Element == U.Element {
    
    var commonElements: [T.Element] = []
                            
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                commonElements.append(lhsItem)
            }
        }
    }
                            
    return commonElements
}

func generics_four() {
    print("--------")

    var result: [Int] = []
    
    result = anyCommonElements2([1,2,3], [3])

    print("result is \(result)")
}







