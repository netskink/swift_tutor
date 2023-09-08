//
// day 11
// https://www.hackingwithswift.com/100/swiftui

//
// structs part 2
//
// access control
// static properties
// static methods
//


struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// however you could do something like this
// where you deposit mone directly bypassing
// the two logic routines.
// account.funds = 1000
// fix by adding private(set)


// Swift provides us with several options, but when you’re learning you’ll only need a handful:
//
// * private
//    -  “don’t let anything outside the struct use this.”
//    -  requires you implement an initializer
// * Use fileprivate for “don’t let anything outside the current file use this.”
// * Use public for “let anyone, anywhere use this.”
//
// There is also some other less common ones
//
// * private(set) for read only access
//
// https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html
//


struct Person {
    private var socialSecurityNumber: String
    init(ssn: String) {
        socialSecurityNumber = ssn
    }
}
let sarah = Person(ssn: "555-55-5555")

// this is a test question which I failed.
// the question did not have the init() routine and
// no values were specified for the name and location.
// When it used the constructor, an init did not exist.
// adding the init() routine and completing the name
// location is the fix
struct Doctor {
    var name: String
    var location: String
    private var currentPatient = "No one"
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
let drJones = Doctor(name: "Esther Jones", location: "Bristol")

// this is similar to above but works?
// Yes, because after init is called all
// the properties have a value.  Not to
// mention the let spotify statement
// is using the name property.
struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")



struct Office {
    private var passCode: String
    var address: String
    var employees: [String]
    init(address: String, employees: [String]) {
        self.address = address
        self.employees = employees
        self.passCode = "SEKRIT"
    }
}
let monmouthStreet = Office(address: "30 Monmouth St", employees: ["Paul Hudson"])



// this is valid swift but non functional
struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: [String]) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: ["Mrs Hughes"])




//
// static
//

struct School2 {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

// NOTE: no instance of School2. Use the class
School2.add(student: "Taylor Swift")
print(School2.studentCount)

// If you want to mix and match static and non-static properties and methods, there are two rules:

// To access non-static code from static code… you’re out of luck: static properties and methods can’t refer to non-static properties and methods because it just doesn’t make sense – which instance of School would you be referring to?
// To access static code from non-static code, always use your type’s name such as School.studentCount. You can also use Self to refer to the current type.
// Now we have self and Self, and they mean different things: self refers to the current value of the struct, and Self refers to the current type.

// Tip: It’s easy to forget the difference between self and Self, but if you think about it it’s just like the rest of Swift’s naming – we start all our data types with a capital letter (Int, Double, Bool, etc), so it makes sense for Self to start with a capital letter too.


struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

AppData.version

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

// this allows him to populate data in his UI using sample data.


//
// checkpoint
//

// create a struct to store information about a car,
// * model,
// * number of seats,
// * current gear,
// * method to change gears up or down.
//
// Have a think about variables and access control:
// * what data should be a variable rather than a constant,
// and what data should be exposed publicly?
// Should the gear-changing method validate its input somehow?

enum Gears {
    case up
    case down
}

struct Car {
    let model: String
    let numSeats: Int
    let maxGears: Int

    private(set) var gear: Int

    mutating func changeGear(mod: Gears) -> Bool {
        if mod == Gears.up && self.gear < maxGears {
            self.gear += 1
            return true
        }
        
        if mod == Gears.down && self.gear > 0 {
            self.gear -= 1
            return true
        }
        return false
    }
    
    init(model: String, numSeats: Int, maxGears: Int) {
        self.model = model
        self.numSeats = numSeats
        self.maxGears = maxGears
        self.gear = 0
    }
}

var mb = Car(model: "slk", numSeats: 2, maxGears: 6)

mb.changeGear(mod: Gears.up)
mb.changeGear(mod: Gears.up)
mb.changeGear(mod: Gears.up)
mb.gear

