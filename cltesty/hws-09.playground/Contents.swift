//
// day 9
// https://www.hackingwithswift.com/100/swiftui

//
// closures - anonymous functions which can be modified,
// passing functions into functions,
// checkpoint 5
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


//
// Why closures?
//
// 1. run some code after a delay
// 2. run some code after an animation has finished
// 3. run some code after a download has finished
// 4. run some code when a user has selected an option from a menu

//
// functions/closures and parameters
//
// Here is the same functionality implemented as a function
// and a closure.  Notice how the parameters are specified

func pay(user: String, amount: Int) {
    // code
}

let payment = { (user: String, amount: Int) in
    // code
}


// TIP
//
// If you think about it, having the parameters inside the braces also neatly
// captures the way that whole thing is one block of data stored inside the
// variable – the parameter list and the closure body are all part of the same
// lump of code, and stored in our variable.
//
// Having the parameter list inside the braces shows why the in keyword is so
// important – without that it’s hard for Swift to know where your closure body
// actually starts, because there’s no second set of braces.


//
// Closures and return values
//

// closure that accepts one parameter and returns nothing (void)
let payment2 = { (user: String) in
    print("Paying \(user)…")
}

// closure that accepts one parameter and returns a boolean
let payment3 = { (user: String) -> Bool in
    print("Paying \(user)…")
    return true
}

// closure that has not parameters and returns a boolean
let payment4 = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}

// other examples of valid swift
//
let learnSwift = {
    print("Closures are like functions")
}
learnSwift()

var cleanRoom = { (name: String) in
    print("I'm cleaning the \(name).")
}
cleanRoom("kitchen")

let measureSize = { (inches: Int) -> String in
    switch inches {
    case 0...26:
        return "XS"
    case 27...30:
        return "S"
    case 31...34:
        return "M"
    case 35...38:
        return "L"
    default:
        return "XL"
    }
}
measureSize(36)

//
// closure shorthand syntax
//

// From last time, we wrote a custom sorting closure
// so that Array.sorted() could put captains names first.
// Here it is again.

let team3 = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam3 = team3.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeam3)

// since the sorted(by:) parameter closure is specified as taking two params and returning a boolean
// this allows us to write the closure with an implied specification.

// This omits the String type specification
let captainFirstTeam4 = team3.sorted(by: { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})

// This further simplifies by omitting the function parenthesis and the by: parameter
// This is called "trailing closure syntax"
let captainFirstTeam5 = team3.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

// One more simplification is to omit the parameters and use positional syntax
// Notice this also omits the usage of "in" since there aren't any params or
// return type specification at this point.
//
// "Swift can infer the parameters the closure accepts"
let captainFirstTeam6 = team3.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

// other examples.
//
// Array.filter() lets us run some code on every item in the array
// and return an array that returns an array where every element
// true for the filter
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// Array.map() transforms every element in the array.
//
// Tip: When working with map(), the type you return doesn’t have to be the
// same as the type you started with – you could convert an array of integers
// to an array of strings, for example.
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


//
// more on trailing closure syntax
//

// A simplified version of UIKit animate function
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

// use of the function, some don't like the closing "})" syntax
animate(duration: 3, animations: {
    print("Fade out the image")
})

// alternate use of the function without closing "})" syntax
animate(duration: 3) {
    print("Fade out the image")
}


//
// accept functions as parameters
//

// We did this previously, to show how to explicitly specifiy functions as parameters
func greetUser3() {
    print("Hi there!")
}

greetUser3()

var greetCopy3: () -> Void = greetUser3
greetCopy3()

//
// a function that generates an array of integers by
// repeating a function a specified number of times
//
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
// 1. takes two parameters and returns one integer everytime its called.
// 2. second parameter is a function.  This function has no parameters
//    and returns one integer everytime its called.
// 3. Inside makeArray(), it creates an array and loop specified number of times
// 4. Each loop iteration, we call the generator that was passed as a parameter.
//    This will return one new integer and put in the numbers array.
// 5. Finally return the array

// The hard part of the function is the first line:
//    func makeArray(size: Int, using generator: () -> Int) -> [Int] {
//
// 1. Create new function
// 2. Function is called makeArray()
// 3. First parameter is size
// 4. Second parameter is a function called generator, which has no parameters and returns one integer
// 5. The makeArray() function returns an array of integers

// The result is that we can make arbitrary sized integer arrays, passing in a function that
// should be used to generate each number
// This uses our makeArray() function with a specified size of 50.
let rolls = makeArray(size: 50) {
    // This generates an Int 1-20
    Int.random(in: 1...20)
}

print(rolls)

//
// Here is a function that accepts three function parameters,
// each of which has no parameters and return nothing.
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

// here is how you call the function
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


//
// some more valid examples
//
let awesomeTalk = {
    print("Here's a great talk!")
}
func deliverTalk(name: String, type: () -> Void) {
    print("My talk is called \(name)")
    type()
}
deliverTalk(name: "My Awesome Talk", type: awesomeTalk)

// another example
let helicopterTravel = {
    print("Get to the chopper!")
}
func travel(by travelMeans: () -> Void) {
    print("Let's go on vacation...")
    travelMeans()
}
travel(by: helicopterTravel)

//
// Checkpoint 5
//

// Input is:
//   let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
// Output:
//   * Filter out any numbers that are even
//   * Sort the numbers in ascending order
//   * map the results to strings in format "7 is a lucky number"




let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]


//func makeLuckyNumberArray(size: Int, using generator: () -> Int) -> [Int] {
//    var numbers = [Int]()
//
//    for _ in 0..<size {
//        let newNumber = generator()
//        numbers.append(newNumber)
//    }
//
//    return numbers
//}

//
// sort ascending function and closure
//
func ascSort(num1: Int, num2: Int) -> Bool {
    num1 > num2
}

let ascSortClosure = { (num1: Int, num2: Int) -> Bool in
    return num1 > num2
}

//
// filter closure
//
let filterEvens = { (num: Int) -> Bool in
    return num % 2 != 0
    
}
let filterEvens2 = { (num: Int) -> Bool in
    !num.isMultiple(of: 2)
}

//
// map closure
//
let myMap = { (num: Int) -> String in
    return "\(num) is a lucky number"
}


print("about to test sorted(by:xxx) using function")
print(luckyNumbers.sorted(by:ascSort))
print("about to test sorted(by:xxx) using closure")
print(luckyNumbers.sorted(by:ascSortClosure))

let sortedLuckyNumbers = luckyNumbers.sorted(by:ascSortClosure)
//let sortedOddLuckyNumbers = sortedLuckyNumbers.filter(filterEvens)
let sortedOddLuckyNumbers = sortedLuckyNumbers.filter(filterEvens2)
print(sortedOddLuckyNumbers)

let luckyStrings = sortedOddLuckyNumbers.map(myMap)
print(luckyStrings)

// alternative solution
print(luckyNumbers.filter(filterEvens2).sorted(by: ascSortClosure).map(myMap))


// HWS Solution
let result = luckyNumbers.filter {$0.isMultiple(of: 2) == false}.sorted().map { "\($0) is a lucky number." }
for item in result {
    print(item)
}

// further enhancement
luckyNumbers.filter(filterEvens2).sorted(by: ascSortClosure).map(myMap).forEach {print($0)}
