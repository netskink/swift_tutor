//
//  nil.swift
//  cltesty
//
//  Created by John F. Davis on 12/8/22.
//

import Foundation

func nil_testy_one() {
    var optionalString: String? = "Hello"
    print("What is optionalString == nil")
    print(optionalString == nil)

    var optionalName: String? = "John Appleseed"
    var greeting = "Hello!"
    if let name = optionalName {
        greeting = "Hello, \(name)"
    }
    print("greeting = \(greeting)")

}


func nil_testy_two() {
    var optionalString: String? = "Hello"
    print("What is optionalString == nil")
    print(optionalString == nil)

    var optionalName: String? = nil
    var greeting = "Hello!"
    if let name = optionalName {
        greeting = "Hello, \(name)"
    }
    print("greeting = \(greeting)")

}

func nil_testy_three() {
    // Another way to handle optional values is to provide a default value using the ?? operator.
    // If the optional value is missing, the default value is used instead.
    
    let nickname: String? = "Johnny"
//    let nickname: String? = nil
    let fullName: String = "John Appleseed"
    let informalGreeting = "Hi \(nickname ?? fullName)"
    
    print("informaGreeting: \(informalGreeting)")
    
    // You can use a shorter spelling to unwrap a value, using the same name for that unwrapped value.
    
    if let nickname {
        print("Hey, \(nickname)")
    }
    
}
