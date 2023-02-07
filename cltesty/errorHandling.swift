//
//  errorHandling.swift
//  cltesty
//
//  Created by John F. Davis on 2/7/23.
//

import Foundation

// You can represent errors using any type that adopts
// error protocol

enum PrinterError: Error {
    case noToner
    case onFire
    case outOfPaper
}


// Use 'throw' to throw an error and 'throws' to mark a function that
// can throw an error.  If you throw an error in a function,
// the function immediatly returns and the code that called
// the function handles the error

func send(job: Int, toPrinter printerName: String) throws -> String {
    
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }

    if printerName == "Out Of Paper" {
        throw PrinterError.outOfPaper
    }

    if printerName == "On Fire" {
        throw PrinterError.onFire
    }    

    return "Job sent"
}


// There are several ways to handle errors.  One way is to use
// do-catch.  Inside the do block, you mark the code that can throw
// an errory by writing 'try' in front of it.  Inside the `catch`
// block, the error is automatically given the name `error`
// unless you give it a differnt name.
func error_one(printerName: String) {
    print("---error_one() -----")
    
    do {
        let printerResponse = try send(job: 1234, toPrinter: printerName)
        print(printerResponse)
    } catch {
        print(error)
    }
}


// You can provide multiple `catch` blocks that handle specific errors.
// You write a pattern after `catch` just as you do after `case`
// in a switch.

func error_two(printerName: String) {
    print("---error_two() -----")
    
    do {
        let printerResponse = try send(job: 1234, toPrinter: printerName)
        print(printerResponse)
    } catch PrinterError.onFire {
        print("I'll just put this over here, with the rest of the fire.")
    } catch let printerError as PrinterError {
        print("Printer error: \(printerError).")
    } catch {
        print(error)
    }
}

// Another way to handle errors is to use `try?` to convert the result to an optional.
// If the function throws an error, the specific error is discarded and
// the result is `nil`.  Otherwise, the result is an optional
// containing the value that the function returned.

func error_three(printerName: String) {
    print("---error_three() -----")

    let printerStatus = try? send(job:1234, toPrinter: printerName)
    
    if printerStatus != nil {
        print("Printer Status: ok.")
    } else {
        print("Printer Status: error.")
    }
}


// Use `defer` to write a block of code that is executed after all other
// code in the function, just before the function returns.
//
// The code is executed regardless of whether the function throws an error.
// You can use `defer` to write setup and cleanup code
// next to each other, even though they need to be executed at different
// times.

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {

    // setup code
    fridgeIsOpen = true
    // cleanup code
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
