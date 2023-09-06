//
// day 10
// https://www.hackingwithswift.com/100/swiftui

//
// structs
// computed properties
// property observers
// custom initializers
//

// As Fred Brooks, the author of the hugely influential book
// The Mythical Man-Month, once said, “the programmer at wit’s
// end... can often do best by disentangling themself from their
// code, rearing back, and contemplating their data. Representation
// is the essence of programming.”

//
// structs
//
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    // these are properties
    let name: String
    var vacationRemaining: Int

    // these are methods
    // since this function modifies a propery it must be
    // marked mutating and cannot be used with a let instance
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

// create with parms in order of properties
// init() is created implicitly,
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// this fails because takeVacation() is mutating
let archer2 = Employee(name: "Sterling Archer", vacationRemaining: 14)
//archer2.takeVacation(days: 5)
print(archer2.vacationRemaining)


// these are identical
var archer3 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archer4 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)


//
// computed properties
//

struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    // a calculated properties
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}
var davis = Employee2(name: "John Davis")
davis.vacationRemaining
davis.vacationTaken += 1
davis.vacationRemaining




struct Employee3 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // a calculated properties
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        // now we can also set an explicit value
        // newValue is the values the assignment provides
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var davis2 = Employee3(name: "John Davis")
davis2.vacationRemaining
davis2.vacationTaken += 1
davis2.vacationRemaining
davis2.vacationRemaining = 10
davis2.vacationRemaining



// other exampls

struct Wine {
    var age: Int
    var isVintage: Bool
    var price: Int {
        if isVintage {
            return age + 20
        } else {
            return age + 5
        }
    }
}
let malbec = Wine(age: 2, isVintage: true)
print(malbec.price)


struct Medicine {
    var amount: Int
    var frequency: Int
    var dosage: String {
        return "Take \(amount) pills \(frequency) times a day."
    }
}


struct Keyboard {
    var isMechanical = false
    var noiseLevel: Int {
        if isMechanical {
            return 11
        } else {
            return 3
        }
    }
}
let majestouch = Keyboard(isMechanical: true)
print(majestouch.noiseLevel)


//
// property observers
//

struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1

struct Game2 {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game2 = Game2()
game2.score += 10
game2.score -= 3
game2.score += 1

// willset and oldset

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


//
// custom initializers
//

struct Player3 {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}
// There is no func keyword. Yes, this looks like a function in terms of its
// syntax, but Swift treats initializers specially.
//
///// Even though this creates a new Player instance, initializers never explicitly have a return type –
///  they always return the type of data they belong to.
//
// I’ve used self to assign parameters to properties to clarify we mean
// “assign the name parameter to my name property”.

struct Player4 {
    let name: String
    let number: Int

    //  dont have to specify everything as a parameter.  Just need
    // to make sure by time init() is complete all properties are
    // initialized.
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player4(name: "Megan R")
print(player.number)


// and extender allows anymous constructions

struct Employee6 {
    var name: String
    var yearsActive = 0
}

extension Employee6 {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee6(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee6()
