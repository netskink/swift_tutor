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
