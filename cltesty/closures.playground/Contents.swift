import Cocoa

print("hello")

//
// NOTE:
// To see closure print messages, select in the menu
// bar View-> Debug Area -> Show Debug Area
//



// basic closure
let driving = {
    print("I'm driving in my car.")
}

// can call the closure by calling like this
driving()

// accepting parameters
let driving2 = { (place: String) in
    print("I'm driving to \(place) in my car.")
}

driving2("Raleigh")

// Returning values
let driving3 = { (place: String) -> String in
    return "I'm driving to \(place) in my car."
}

print(driving3("Cary"))

// closures as function parameter
let driving4 = { () -> String in
    return "I'm driving in my car."
}

func travel(action: () -> String) {
    print("I'm ready to go.")
    action()
    print("I've arrived!")
}

travel(action: driving4)

// closures as function parameter with parameter
let driving5 = { (hours: Int) -> String in
    return "I'm driving \(hours) in my car."
}

func travel2(action: (Int) -> String) {
    print("I'm ready to go.")
    action(2)
    print("I've arrived!")
}

travel2(action: driving5)


// trailing closure syntax
// does not need the parameter parentheses
print("=== Trailing closure syntax example. ===")

func travel3(action: () -> Void) {
    print("I'm ready to travel...")
    action()
    print("I've arrived!")
}

// when the last parameter in a function is
// a closure, instead of this
// travel3() {
//     print("I'm driving in my car.")
// }

// you can do this: (where you leave off the
// parentheses in the calling of the function.
travel3 {
    print("I'm driving in my car.")
}





//
// using closures with parameters
//


print("=== Trailing closure syntax and the function has a closure parameter example. ===")


// This function has a parameter which
// is a closure that uses a parameter.
func travel4(myduration: (Int) -> Void) {
    print("I'm ready to go.")
    myduration(4)
    print("I've arrived!")
}
// now the closure which we pass as a function
// parameter that requires a parameter is used
// like to call the function.
travel4 { (myduration: Int) in
    print("I'm driving \(myduration) hours in my car.")
}



//
// Using closures as parameters with return values
//

print("=== Trailing closure syntax and the function has a closure with a return value example. ===")

// This function has a parameter which
// is a closure that uses a parameter.
func travel5(action: (String) -> String) {
    print("I'm ready to go.")
    let description = action("london")
    print(description)
    print("I've arrived!")
}

// now call the function using trailing
// closure syntax
travel5 { (place: String) in
    return("I'm driving to \(place) in my car.")
}


//
// sorthand parameter names
//

print("=== demo shorthand notation. ===")

// This function has a parameter which
// is a closure that uses a parameter.
func travel6(action: (String) -> String) {
    print("I'm ready to go.")
    let description = action("london")
    print(description)
    print("I've arrived!")
}

// we can call it like this:
travel6 { (place: String) in
    return("I'm driving to \(place) in my car.")
}

// or like this:
travel6 { (place: String) -> String in
    return("I'm driving to \(place) on my bike.")
}

// however swift knows the parameter to that
// closure must be a string, so we can remove it
travel6 { place in
    return("I'm driving to \(place) on my skateboard.")
}

// since the closure only has one line of code that
// must be the one that returns the value so swift
// lets us remote the return keyword
travel6 { place in
    "I'm driving to \(place) on my snowmobile."
}

// swift has as shorthand which uses the $n syntax
// and then you avoi the parameter as well
travel6 {
    "I'm driving to \($0) on my hoverboard."
}


//
// closures with multiple parameters
//

print("=== closures with multiple parameters. ===")

// This function has a parameter which
// is a closure that uses two parameters
// and returns a string.
func travel7(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("london", 60)
    print(description)
    print("I've arrived!")
}

// swift has as shorthand which uses the $n syntax
// and then you avoi the parameter as well
travel7 {
    "I'm driving to \($0) at \($1) miles per hour."
}

//
// Returning closures from functions
//

print("=== Returning closures from functions. ===")

// This function has a parameter which
// is a closure that uses two parameters
// and returns a string.
func travel8() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel8()
result("London")

// can also do directly
let result2 = travel8()("Durham")


//
// Capturing values
//

print("=== Capturing values. ===")

// closure capturing happens if we create values in travel()
// that get used inde the closure.  For example, lets
// track how often the returned clousre is called.
func travel9() -> (String) -> Void {
    var counter = 1
    return {
        print("I'm going to \($0).  This is \(counter) trip.")
        counter += 1
    }
}

let result3 = travel9()
result3("London")
result3("London")
result3("London")


