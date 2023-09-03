//
// day 8
// https://www.hackingwithswift.com/100/swiftui

//
// Functions part 2
//

// we will use sqrt() from Cocoa
import Cocoa


// default parameters
// handling errors in functions
// checkpoints



// previously
func printTimesTables(for number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)


func printTimesTables2(for number: Int, end: Int = 3) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables2(for: 5, end: 20)
printTimesTables2(for: 5)


//
// we previously used a function which we relied on the default parameter
//
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
// removeall by default removes the data and free's the space
//characters.removeAll()
// we can remove the data without free so it can be reused
characters.removeAll(keepingCapacity: true)
print(characters.count)

// default parameter with external name and internal named parameter
func takePicture(withFlash flash: Bool = true) {
    if flash {
        print("I'm taking a photo with flash")
    } else {
        print("I'm taking a photo")
    }
}

takePicture()
takePicture(withFlash: false)

// default parameter with parameter that does have to be set explictly.
func parkCar(_ type: String, automatically: Bool = true) {
    if automatically {
        print("Nice - my \(type) parked itself!")
    } else {
        print("I guess I'll have to do it.")
    }
}
parkCar("Tesla")
parkCar("Prius", automatically: false)

//
// handling errors in functions
//

// specify the types of errors that can occur
// NOTICE: the enum conforms to type Error
enum PasswordError: Error {
    case short, obvious
}

//
// define a function that normally returns a string, but
// can throw an exception.  The exception it throws
// is one of the ones we defined earlier
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// when we use it, we must use do/try/catch block
do {
    let result = try checkPassword("abc")
    print("Password rating: \(result)")
} catch {
    print("handle errors")
}

// a better approach
do {
    let result = try checkPassword("abc")
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("password to short")
} catch PasswordError.obvious {
    print("obvious password")
} catch {
    // generic unspecified error
    print("An error occured")
}

// Tip: Most errors thrown by Apple provide a meaningful message that you can
// present to your user if needed. Swift makes this available using an error
// value that’s automatically provided inside your catch block, and it’s common
// to read error.localizedDescription to see exactly what happened.

// a post on throwing exceptions
// https://www.donnywals.com/working-with-throwing-functions-in-swift/

// you can have intermix throwing and non throwing in same block

func throwingFunction1(_ doit: Bool) throws {
    if doit {
        throw PasswordError.short
    }
}
func nonThrowingFunction1() {}
func throwingFunction2(_ doit: Bool) throws {
    if doit {
        throw PasswordError.short
    }
}
func nonThrowingFunction2() {}
func throwingFunction3(_ doit: Bool) throws {
    if doit {
        throw PasswordError.short
    }
}
func nonThrowingFunction3() {
    print("non throwing function 3 ran")
}


do {
    try throwingFunction1(false)
    nonThrowingFunction1()
    try throwingFunction2(false)
    nonThrowingFunction2()
    try throwingFunction3(false)
} catch {
    // handle errors
    print("an error occured in one of three functions")
}

enum ChargeError: Error {
    case noCable
    case noPower
}
func chargePhone(atHome: Bool) throws {
    if atHome {
        print("Phone is charging...")
    } else {
        throw ChargeError.noPower
    }
}



//
// checkpoints
//

// write a function that finds the sqrt of a number.
// If the problem is to small or to large throw an
// exception


enum SqrtError: Error {
    case tooSmall
    case tooLarge
    case noRoot
}

func mySqrt(_ num: Int) throws -> Int {
    if num < 1 {
        throw SqrtError.tooSmall
    } else if num > 10000 {
        throw SqrtError.tooLarge
    } else {
        print("calculating...")
    }
    // calculate sqrt
    for i in 1...100 {
        if (i*i) == num {
            return i
        }
    }
    throw SqrtError.noRoot
}

do {
    let result = try mySqrt(625)
    print("result: \(result)")
} catch SqrtError.tooSmall {
    print("input number too small")
} catch SqrtError.tooLarge {
    print("input number too large")
} catch SqrtError.noRoot {
    print("no rational root")
} catch {
    print("some unexpected error occured!")
}


