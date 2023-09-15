import Cocoa

//
// day 14
// https://www.hackingwithswift.com/100/swiftui




//
// optinals and unwrap with if
// optionals and unwrap with guard
// optionals and unwrap with nil coalescing operator ??
// how to handle failures with optionals


//
// optionals and unwrap with if
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


//
// nil coalescing - third way to unwrap optionals
//

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

// third way to unwrap
let new_captain = captains["Serenity"] ?? "N/A"

// remember you can also do this, specifying default value for
// unknowns in dictionaries
let new_captain2 = captains["Serenity", default: "N/A"]

// But nil coalescing also works on arrays.
// Here, randomElement() retrieves a random element from
// an array, but since an array might be empty, it
// can return a nil that would need to be unwrapped.
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"


// It even works with a struct that
// might have one of its optional members
// not specified
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)


// even string to int conversions
let input = ""
let number3 = Int(input) ?? 0
print(number3)

// You can chain nil coalescing operators

func first() -> String? {
    return nil
}
func second() -> String? {
    return nil
}



let savedData = first() ?? second() ?? ""


//
// optional chaining
//

// example of two concepts - optional unwrapping and optional
// coalescing.
//
//let names = ["Arya", "Bran", "Robb", "Sansa"]
// when Bran was randomply picked
//    "Next in line: BRAN"
//
let names:[String] = []
// when names is empty array
//     "Next in line: No one"
//
//       optional coalescing in case the chain is nil
//                                               |
//                                               |
//  optional chaining to unwrap randomeElement() |
//  in case it returns nil       |               |
//                               |               |
//                               v               v
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")


// another example
struct Book3 {
    let title: String
    let author: String?
}

var book3: Book3? = nil
let author3 = book3?.author?.first?.uppercased() ?? "A"
print(author3)

// yet another example
// optional chaining and optional coalescing
let names5 = ["Vincent": "van Gogh",
              "Pablo": "Picasso",
              "Claude": "Monet"]
let surnameLetter = names5["Vincent"]?.first?.uppercased() ?? "Unknown"

// examples

let songs: [String]? = [String]()
let finalSong = songs?.last?.uppercased()

//
func albumReleased(in year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    case 2017: return "Reputation"
    default: return nil
    }
}
let album6 = albumReleased(in: 2005)?.uppercased()

//
let shoppingList = ["eggs", "tomatoes", "grapes"]
let firstItem = shoppingList.first?.appending(" are on my shopping list")

//
let captains2: [String]? = ["Archer", "Lorca", "Sisko"]
let lengthOfBestCaptain = captains2?.last?.count

//
let opposites3 = ["hot": "cold", "near": "far"]
let oppositeOfLight = opposites3["light"]?.uppercased()


// resume part 5
// how to handle function errors with try?

