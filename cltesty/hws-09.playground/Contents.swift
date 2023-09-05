//
// day 9
// https://www.hackingwithswift.com/100/swiftui

//
// closures - anonymous functions which can be modified,
// passing functions into functions,
// checkpoint 5
//

// we will use sqrt() from Cocoa
import Cocoa


//
// functions
//

func greetUser() {
    print("Hi there!")
}

greetUser()

// you can assign a variable to a function
// and call it with the variable.
// NOTICE: when assigning the function don't use ()
var greetCopy = greetUser
greetCopy()


// You can skip using the func keyword.
// NOTE: this is called a "closure expression"
let sayHello = {
    print("Hi there!")
}

sayHello()

// If you want to use parameters to the function
// do this style:
// Note: This builds a string and returns a string
// The "in" keyword marks the end of parameters and return type
let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}
// Note: when we use the closure we don't specify the name
// of the parameter.
print(sayHello2("John"))

// Looking back at the greetCopy variable.  If we
// specified the variable's type it would be like this
var greetCopy2: () -> Void = greetUser
// 1. (), means a function with no params
// 2. -> void, means it returns nothing
// 3. NOTE: sometimes rather than  void, () will be used.

//
// a more complex example
//

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
// data is a function variable that:
// 1. takes a single parameter of type Int
// 2. returns a string
// This matches the function specification or getUserData()
//
// Note the copy does not use the for parameter in the type specification
// or when its used.
//
// TIP: "external parameter names only matter when we’re calling a function directly,
// not when we create a closure or when we take a copy of the function first."
let user = data(1989)
print(user)


//
// modifying functions
//

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

// We want to write a sorting function to take a name of players
// sort the names where captain is first and then the other names
// are abc order.  This will be used by the Array.sorted() closure
// where the second parameter is a comparision function of two words.
// If given two words and return true when word1 should be before word2.
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

// Use of sorted() second parameter which is a custom sorting function.
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)


//
// alternative using closure
//

let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeam2)

