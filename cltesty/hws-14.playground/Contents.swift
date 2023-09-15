import Cocoa

//
// day 14
// https://www.hackingwithswift.com/100/swiftui

//
// optionals
//



//
// optinals and unwrap with if
// optionals and unwrap with guard
//

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

// This will return nill
let peachOpposite = opposites["Peach"]


// method one for unwrapping an optional
if let marioOpposite = opposites["Mario"] {
    // marioOpposite is valid here
    print("Mario's opposite is \(marioOpposite)")
    // marioOpposite is valid until here
}


var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
// this won't work
//print(square(number: number))

// this method uses a new name
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

// this is more common style
// uses a let with same name as var
// remember the var "shadow" is only valid between the braces
if let number = number {
    print(square(number: number))
}

// why swift uses optonals
// https://www.youtube.com/watch?v=7a7As0uNWOQ

//
// most common method of unwrapping an optional
//

func getUsername() -> String? {
    "Taylor"
}

if let username = getUsername() {
    print("Username is \(username)")
} else {
    print("No username")
}

//
// valid examples
//

var favoriteMovie: String? = nil
favoriteMovie = "The Life of Brian"
if let movie = favoriteMovie {
    print("Your favorite movie is \(movie).")
} else {
    print("You don't have a favorite movie.")
}

let song: String? = "Shake it Off"
if let unwrappedSong = song {
    print("The name has \(unwrappedSong.count) letters.")
}

let currentDestination: String? = nil
if let destination = currentDestination {
    print("We're walking to \(destination).")
} else {
    print("We're just wandering.")
}

let album = "Red"
let albums = ["Reputation", "Red", "1989"]
if let position = albums.firstIndex(of: album) {
    print("Found \(album) at position \(position).")
}

//
// optionals and unwrap with guard
//

// notice, guard requires use of return
// its an early return style.
// Is also the opposite of if let.
// It has another characteristic that
// number is valid until the function
// closing brace
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    // number is unwrapped and valid
    print("\(number) x \(number) is \(number * number)")
    // end of number is unwrapped and unvalid
}



//
//
//
var myVar: Int? = 3

func foo1() {
    if let unwrapped = myVar {
        print("Run if myVar has a value inside")
    }
}

func foo2() {
    guard let unwrapped = myVar else {
        print("Run if myVar doesn't have a value inside")
        return
    }
}



func printSquare2(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

//
// prefer use of guard/return when verifying function vars
// early in a function.
//

func getMeaningOfLife() -> Int? {
    42
}

func printMeaningOfLife() {
    guard let name = getMeaningOfLife() else {
        return
    }

    print(name)
}

// TIP:
// So, use if let if you just want to unwrap some optionals, but
// prefer guard let if you’re specifically checking that conditions
// are correct before continuing.


// resume
// 3 How to unwrap optionals with nil coalescing
