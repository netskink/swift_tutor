import Cocoa


//
// Creating and using a struct
//

print("=== Creating and using a struct. ===")


struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"
print(tennis.name)


//
// Computed properties
//

print("=== Computed properties. ===")

struct Sport2 {
    var name: String
    var isOlympicSport: Bool
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)
let fencing = Sport2(name: "Fencing", isOlympicSport: true)
print(fencing.olympicStatus)


//
// Property observers
//

print("=== Property observers. ===")

struct Progress {
    var task: String
    var amount: Int {
        // can also do willSet but not often used
        didSet {
            if amount == 100 {
                print("\(task) is complete.")
            } else {
                print("\(task) is now \(amount) complete.")
            }
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//
// Methods
//

print("=== Methods. ===")

struct City {
    var population: Int
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
print(london.collectTaxes())


//
// Mutating methods
//

print("=== Mutating methods. ===")

struct Person {
    var name: String
    mutating func makeAnonymous() {
        name = "Anoynymous"
    }
}

// Because the function changes a variable
// swift only allow that method to be called
// on instances which are variables.

var person = Person(name: "Ed")
person.makeAnonymous()

//let person2 = Person(name: "John")
//person2.makeAnonymous()


//
// Properties and methods of strings
// NOTE: Strings are structs - they have their own methods and properties.
//

print("=== Properties and methods of strings. ===")

let string = "Do or do not, there is no try."

print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())


//
// Properties and methods of arrays
// NOTE: Arrays are structs - they have their own methods and properties.
//

print("=== Properties and methods of arrays. ===")

var toys = ["Woody"]
toys.append("Buzz")

print(toys.count)
print(toys.firstIndex(of: "Buzz"))

print(toys)
print(toys.sorted())
toys.remove(at: 0)
print(toys)



//
// Initializers
//

print("=== Initializers. ===")

// to create one, we must specify a name.
struct User {
    var username: String
}
var user = User(username: "John")

// With an initializer we can accept a default
struct User2 {
    var username: String
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
var user2 = User2()
print(user2)
user2.username = "John"
print(user2)
print(user2.username)


//
// Self
//

print("=== Self. ===")

struct Person2 {
    var name: String
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
    mutating func makeAnonymous() {
        name = "Anoynymous"
    }
}

var person2 = Person2(name: "John")
print(person2)


//
// Lazy Properties
//

print("=== Lazy Properties. ===")

struct FamilyTree {
    init() {
        print("Creating family tree!")
        sleep(1)
        print("Family tree computed!")
    }
}

// We could use inside a person struct like this

struct Person3 {
    var name: String
    // with lazy, the property is not created until referenced
    lazy var familyTree = FamilyTree()
    init(name: String) {
        self.name = name
    }
}
var ed = Person3(name: "Ed")
print(ed)
print(ed.familyTree)


//
// Static properties and methods
//

print("=== Static properties and methods. ===")

struct Student {
    static var classSize = 0
    var name: String
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed2 = Student(name: "Ed")
let taylor = Student(name: "Taylor")

print(Student.classSize)


//
// Access Control
// Use of private
//

print("=== Access control. ===")

struct Person4 {
    private var id: String
    var name: String
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
    func identify() -> String {
        return "My id is \(id)"
    }
}

let ed3 = Person4(name: "Ed", id: "1234")
print(ed3.identify())
