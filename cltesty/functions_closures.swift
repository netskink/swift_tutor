//
//  functions_closures.swift
//  cltesty
//
//  Created by John F. Davis on 12/12/22.
//

import Foundation


func functions_one(person: String, day: String) -> String {
    print("------")

    return "Hello \(person), today is \(day)"
}

// No label and custom label
func functions_two(_ person: String, on day: String) -> String {
    print("------")

    return "Hello \(person), today is \(day)"
}

// No label and custom label
func functions_three(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    print("------")

    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
        
    }
    return (min, max, sum)
}

// Functions can be nested. Nested functions have access to
// variables that were declared in the outer function. You
// can use nested functions to organize the code in a function that’s long or complex.
func functions_four() -> Int {
    print("------")
    
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}


// functions can return another function
// This is a function that returns a function
// which takes a parameter of an int and returns
// an int.
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

// A function can take another function as a
// parameter
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}


// Functions are actually a special case of closures: blocks of code that can be called later.
//
// The code in a closure has access to things like variables and functions that were
// available in the scope where the closure was created, even if the closure is in a
// different scope when it’s executed.
//
// You saw an example of this already with nested functions. You can write a closure
// without a name by surrounding code with braces ({}). Use 'in' to separate the
// arguments and return type from the body.
func demo_closure_one() {
    print("------")

    
    var numbers = [1,5,20,12]
    var output: [Int]
    
    // The closure is delmited by ({})
    // The parameters and resturn type is separated from
    // the code by the word 'in'
    output = numbers.map ({ (number: Int) -> Int in
        let result = 3 * number
        return result
    })

    // numbers is unmodified
    print(numbers)
    // the output is each of the numbers multiplied by 3
    print(output)
}

// modify the function to return zero for
// every odd number
func demo_closure_two() {
    print("------")

    
    var numbers = [1,5,20,12]
    var output: [Int]
    
    // The closure is delmited by ({})
    // The parameters and resturn type is separated from
    // the code by the word 'in'
    output = numbers.map ({ (number: Int) -> Int in
        if number % 2 == 0 {
            return number
        } else {
            return 0
        }
    })

    // numbers is unmodified
    print(numbers)
    // the result is each of the numbers multiplied by 3
    print(output)
}



// You have several options for writing closures more concisely.
//
// When a closure’s type is already known, such as the callback for a delegate,
// you can omit the type of its parameters, its return type, or both.
//
// Single statement closures implicitly return the value of their only statement.

func demo_closure_three() {
    print("------")

    
    var numbers = [1,5,20,12]

    let mappedNumbers = numbers.map({ number in 3 * number})
    
    // numbers is unmodified
    print(numbers)
    // the result is each of the numbers multiplied by 3
    print(mappedNumbers)
}


// You can refer to parameters by number instead of by name.
//
// This approach is especially useful in very short closures. A closure
// passed as the last argument to a function can appear immediately
// after the parentheses. When a closure is the only argument to a function,
// you can omit the parentheses entirely.
func demo_closure_four() {
    print("------")

    
    var numbers = [1,5,20,12]

    
    //  Returns the elements of the sequence, sorted using the given predicate as the comparison between elements.
    //
    // Declaration
    //
    // func sorted(by areInIncreasingOrder: (Self.Element, Self.Element) throws -> Bool) rethrows -> [Self.Element]
    
    // with parentheses
    let sortedNumbers = numbers.sorted( by: ({ $0 > $1 }) )
    // omitting parentheses
    // let sortedNumbers = numbers.sorted { $0 > $1 }

    // numbers is unmodified
    print(numbers)
    // the result is each of the numbers multiplied by 3
    print(sortedNumbers)
}
