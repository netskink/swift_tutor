//
//  main.swift
//  cltesty
//
//  Created by John F. Davis on 12/8/22.
//

import Foundation

print("Hello, World!")

// array
array_testy_one()


// dictionary
dict_testy_one()

// nil
nil_testy_one()
nil_testy_two()
nil_testy_three()

// control
control_testy_one()
control_testy_two()
control_testy_three()
control_testy_four()

// functions and closures
// You have to specify the parameters.
print(functions_one(person: "john", day: "monday"))
// if _, you don't need to specify parameters.
// you can also override the parameter name.
print(functions_two("john", on: "monday"))
// array as parameter and tuple as output
print(functions_three(scores: [1,2,3]))
print(functions_four())


// a function which returns a function
// Note, you can not call makeIncrement directly
// and get result.
//print(makeIncrementer())
var increment = makeIncrementer()
print(increment(7))

// A function can have a parameter which
// is a function
var numbers = [1,5,20,12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))

// closure
demo_closure_one()
demo_closure_two()
demo_closure_three()
demo_closure_four()

// objs and classes
obj_class_one()
obj_class_two()
obj_class_three()
obj_class_four()
obj_class_five()
obj_class_six()

// Enumerations and Structures
enum_struct_one()
enum_struct_two()
enum_struct_three()
print(enum_struct_five())


// concurrency
await concurrency_one()


// protocols and extensions
protocol_one()
protocol_two()
protocol_three()
protocol_four()
protocol_five()


