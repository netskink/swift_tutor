//
//  concurrency.swift
//  cltesty
//
//  Created by John F. Davis on 1/20/23.
//

import Foundation


// use async to mark a function that runs asynchronously
//
// https://docs.swift.org/swift-book/LanguageGuide/Functions.html
// this function demos a function which uses
// argument labels and parameter names
// argument label - first
//                - before the parameter
//                - used by calling function
//                - eg. from
// parameter name - second
//                - after the label
//                - used by the function implementation
func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    
    return 501
}


// mark a call to an async function by writing
// await in front of it

func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}


func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}


// use Task to call asynchrous functions from synchronous code,
// without waiting for them to rueturn


func concurrency_one() async {
    print("--------")
    
    Task {
        await connectUser(to: "primary")
    }
}





