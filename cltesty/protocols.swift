//
//  protocols.swift
//  cltesty
//
//  Created by John F. Davis on 2/3/23.
//

import Foundation

// Use protocol keyword to define a protocol
//
// This looks like an interface description
//
protocol ExampleProtocol {
     var simpleDescription: String { get }
     mutating func adjust()
}


// classes, enumerations and structures can all utilize protocols

// a class implementing the protocol
class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "A very simple class."
     var anotherProperty: Int = 69105
     func adjust() {
          simpleDescription += "  Now 100% adjusted."
     }
}

// a struct implementing the protocol
struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "A simple structure"
     // notice it uses the mutating keyword unlike the class example
     mutating func adjust() {
          simpleDescription += " (adjusted)"
     }
}


func protocol_one() {
    print("--------")

    var a = SimpleClass()
    print("a after creation, a.simpleDescription: \(a.simpleDescription)")
    a.adjust()
    print("a after adjust, a.simpleDescription: \(a.simpleDescription)")
    
    let aDescription = a.simpleDescription

    var b = SimpleStructure()
    print("b after creation, a.simpleDescription: \(b.simpleDescription)")
    b.adjust()
    print("b after adjust, a.simpleDescription: \(b.simpleDescription)")

    let bDescription = b.simpleDescription
}

// Add another requirement to ExampleProtocol.
//
// What changes do you need to make to SimpleClass and SimpleStructure so that they still conform to the protocol?
//


// Use protocol keyword to define a protocol
//
// This looks like an interface description
//
protocol ExampleProtocol2 {
    var simpleDescription: String { get }
    var detail: String { get }
    mutating func adjust()
}
class SimpleClass2: ExampleProtocol2 {
    var simpleDescription: String = "A very simple class."
    var detail: String = "this is detail"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
struct SimpleStructure2: ExampleProtocol2 {
    var simpleDescription: String = "A simple structure"
    var detail: String = "this is detail"
    // notice it uses the mutating keyword unlike the class example
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}



func protocol_two() {
    print("--------")

    var a = SimpleClass2()
    print("a after creation, a.simpleDescription: \(a.simpleDescription)")
    a.adjust()
    print("a after adjust, a.simpleDescription: \(a.simpleDescription)")

    
    let aDescription = a.simpleDescription

    var b = SimpleStructure2()
    print("b after creation, a.simpleDescription: \(b.simpleDescription)")
    b.adjust()
    print("b after adjust, a.simpleDescription: \(b.simpleDescription)")


    let bDescription = b.simpleDescription

    
}


// Notice the use of the mutating keyword in the declaration of SimpleStructure
// to mark a method that modifies the structure. The declaration of SimpleClass
// doesn’t need any of its methods marked as mutating because methods on a
// class can always modify the class.
//





// Use extension to add functionality to an existing type, such as new methods
// and computed properties. You can use an extension to add protocol conformance
// to a type that’s declared elsewhere, or even to a type that you imported from
// a library or framework.


// This extends Int to have a protocol.
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
 }


func protocol_three() {
    print("--------")
    
    print(7.simpleDescription)

}

// Write an extension for the Double type that adds an absoluteValue property.

protocol absProto {
    var simpleDescription: String { get }
    func absThing() -> Double
}

extension Double: absProto {
    var simpleDescription: String {
        return "The number \(self)"
    }
    func absThing() -> Double{
        return abs(self)
    }
 }

func protocol_four() {
    print("--------")
    
    print((-7.0).absThing())

}

// You can use a protocol name just like any other named
// type—for example, to create a collection of objects that
// have different types but that all conform to a single protocol.
// When you work with values whose type is a protocol type,
// methods outside the protocol definition aren’t available.


func protocol_five() {
    print("--------")
    
    var a = SimpleClass()
    print("a after creation, a.simpleDescription: \(a.simpleDescription)")
    a.adjust()
    print("a after adjust, a.simpleDescription: \(a.simpleDescription)")

    
    let protocolValue: ExampleProtocol = a
    print(protocolValue.simpleDescription)
    // print(protocolValue.anotherProperty)  // Uncomment to see the error
    
}
