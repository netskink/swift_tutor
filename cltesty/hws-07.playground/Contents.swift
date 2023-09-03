//
// day 7
// https://www.hackingwithswift.com/100/swiftui

//
// Functions
//

// we will use sqrt() from Cocoa
import Cocoa

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

func printTimesTables(number: Int) {
    for i in 1...number {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

// we can redefine it or does it work because it has
// two params?
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)
// positinal params do not work
//printTimesTables(5, 20)

// this will not work because even with named params
// they must be specified in correct position/order
//printTimesTables(end: 20, number: 5)

let root = sqrt(169)
print(root)


//
// function with a return value
//
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func areLettersIdentical(word1: String, word2: String) -> Bool {
    let sorted1 = word1.sorted()
    let sorted2 = word2.sorted()
    return sorted1 == sorted2
}

areLettersIdentical(word1: "john", word2: "davis")
areLettersIdentical(word1: "john", word2: "john")
areLettersIdentical(word1: "john", word2: "nhoj")

//
// There is a trick with swift.
// You can omit the return statement if its a one-liner
// and the one-liner calculates the return result
func areLettersIdentical2(word1: String, word2: String) -> Bool {
    word1.sorted() == word2.sorted()
}

areLettersIdentical2(word1: "john", word2: "davis")
areLettersIdentical2(word1: "john", word2: "john")
areLettersIdentical2(word1: "john", word2: "nhoj")

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

pythagoras(a: 2.0, b: 3.9)


// using the tertiary operator to do a one liner
// with immplicit return
func greet(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}
greet(name: "john")
greet(name: "Taylor Swift")

//
// using an array to return multiple values
//
func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")


//
// using a dictionary to return multiple values
//
func getUser2() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}

let user2 = getUser2()
print("Name: \(user2["firstName", default: "Anonymous"]) \(user2["lastName", default: "Anonymous"])")

//
// using a tuple to return multiple values
//
func getUser3() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user3 = getUser3()
print("Name: \(user3.firstName) \(user3.lastName)")

// equivalent
// demoing you don't need to specify the key names
// during the assignment
func getUser4() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}
let user4 = getUser4()
print("Name: \(user4.firstName) \(user4.lastName)")


// use of tuple without names
// in this case you use postion to retrieve
// values.  Even when named, you can
// use the position indecies to retrieve value
// as shhown in last name read
func getUser5() -> (String, lastName: String) {
    ("Taylor", "Swift")
}

let user5 = getUser5()
print("Name: \(user5.0) \(user5.1)")

// you can also skip the tuple assignment and
// get individual values.  You must specify
// each item in the tuple receiver.  If you
// dont care about a particular value use
// _ as a place holder.  Note: the receiver
// tuple does not need to match the keynames.
// Instead only position and number of keys
// is used.
func getUser6() -> (firstName: String, middleName: String, lastName: String) {
    (firstName: "Taylor", middleName: "gotme", lastName: "Swift")
}
let (_, b, _) = getUser6()
print("\(b)")

//
// naming parameters
//

func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()

    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)
print("\(rolls)")

//
// parameters determine function signature
//
func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

//
// use the _ to avoid specifying the parameter name when called
//
func isUppercase2(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
// this makes for simpler function usage
let result2 = isUppercase2(string)

//
// Swift also allows a function external parameter name
// and function internale parameter name.  In this case
// the parameter FOR reads better and its possible to use
// externally but not internally since its a reserved word.
func printTimesTables2(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables2(for: 5)

// Tip: Earlier I mentioned that technically values you pass in to a function are called “arguments”,
// and values you receive inside the function are called parameters. This is where things get a bit
//muddled, because now we have argument labels and parameter names side by side, both in the function
//definition. Like I said, I’ll be using the term “parameter” for both, and when the distinction
//matters you’ll see I distinguish between them using “external parameter name” and “internal parameter name”.
