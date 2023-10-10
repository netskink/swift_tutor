//
// day 13
// https://www.hackingwithswift.com/100/swiftui

//
// protocols, extensions and checkpoint 8
//



//
// protocols
//

// a contract requirement
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// car implements the requirements of the contract
struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

// this says that the function "uses" a class which implements
// the vehicle protocol.  However this is a specific implementation
// and does not buy us much.  Below is a better implementation.
func commute(distance: Int, using vehicle: Car) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

// a better implementation using a generic implemnation
// of the protobol
func commute2(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}


// this allows us to use this function with a second class
// that implements the vehicle protocol

struct Bicycle: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute2(distance: 50, using: bike)


//
// add some properties
//

protocol Vehicle2 {
    // this is read only
    var name: String { get }
    // this must be read/write
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Bicycle2: Vehicle2 {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

struct Car2: Vehicle2 {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

func getTravelEstimates(using vehicles: [Vehicle2], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car2 = Car2()
let bike2 = Bicycle2()

getTravelEstimates(using: [car2, bike2], distance: 150)


//
// another example
//

protocol Purchaseable {
    var name: String { get set }
}

struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Car3: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}


//
// extensions
//

// import Cocoa to get
//    .whitespacesAndNewlines
//    .trimmingCharacters()
import Cocoa

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)


// an extension
extension String {
    // this returns a new string
    // convention is if returning new value, use ed or ing ending.
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    // this modifies the existing string
    mutating func trim() {
        self = self.trimmed()
    }
    
    // this modifies the existing string
    mutating func trim2() -> String {
        self = self.trimmed()
        return self
    }


    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
    
}
print(quote)
//quote.trim()
// this fails though. why?
// It returns void.  Needs to be modified. see HWS13.md
print(quote.trim())
print(quote.trim2())


//print(quote.trimmed())

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""
print(lyrics.lines)

print(lyrics.lines.count)


//
// tip
//

struct Book2 {
    let title: String
    let pageCount: Int
    let readingHours: Int

//    init(title: String, pageCount: Int) {
//        self.title = title
//        self.pageCount = pageCount
//        self.readingHours = pageCount / 50
//    }
}

// with the commented out code in place we would lose this autocomplete functionality
let lotr = Book2(title: "lotr", pageCount: 2424, readingHours: 24)

extension Book2 {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
// now we get the second autocomplete as well!
let fotr = Book2(title: "fotr", pageCount: 298348)


//
// example extensions
//

extension Int {
    func clamped(min: Int, max: Int) -> Int {
        if (self > max) {
            return max
        } else if (self < min) {
            return min
        }
        return self
    }
}

// computed propery?
extension String {
    var isLong: Bool {
        return count > 25
    }
}

extension String {
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
}

extension String {
    func isUppercased() -> Bool {
        return self == self.uppercased()
    }
}




//
// opaque return types
//

func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

print(getRandomNumber() == getRandomNumber())

func getRandomNumber2() -> some Equatable {
    Int.random(in: 1...6)
}

print(getRandomNumber2() == getRandomNumber2())
getRandomNumber()
getRandomNumber2()



//
// protocol extensions
//

let guests = ["Mario", "Luigi", "Peach"]

// this works
if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

// this works
if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

// this is an extension approach
extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
// then from this point forward when we create an array
// we can do this
let guests2 = ["Mario", "Luigi", "Peach"]
if guests2.isNotEmpty {
    print("Guest count: \(guests.count)")
}

// we can do even better since Array, Set and Dictionary
// all conform to built-in protocol Collection.
// Thus we can make an extesnion to collection protocol
//
// protocol extension
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
let guests3 = ["Mario", "Luigi", "Peach"]
if guests3.isNotEmpty {
    print("Guest count: \(guests.count)")
}

//
// another protocol extension example
//

// protocol
// All conforming types must implement a sayHello() method
protocol Person {
    var name: String { get }
    func sayHello()
}
// We can add a default implementation of sayHello() via
// an extension.
extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}
// Now all conforming types can add their own sayHello() method if they want, but they don't
// need to - they can always rely on the provided one inside our protocol extension

// so we create an Employee without the sayHello() method
struct Employee: Person {
    let name: String
}

// But because it comforms to Person, we could use the default implementation in the extension
let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

//
// Protocol extensions are used everywhere in Swift, which is why you’ll often see
// it described as a “protocol-oriented programming language.”
//
//

// as an example Swift's sarrays all have an allSatisfy() method that
// returns true if all the items in the array pass a test.
let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2) }
// It also works on Sets
let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }
// and dictionaries
let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }

// swift wrote a single allSatisfy() method that works on a protocol
// called Sequence, which all array, sets and dictionaries conform to.

//
// Checkpoint 8
//

// Your challenge is this: make a protocol that describes a building,
// adding various properties and methods, then create two structs,
// House and Office, that conform to it. Your protocol should require the following:
//
// * A property storing how many rooms it has.
// * A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
// * A property storing the name of the estate agent responsible for selling the building.
// * A method for printing the sales summary of the building, describing what it is along with its other properties.

protocol Building {
    var type: String {get}
    var numRooms: Int {get}
    var cost:Int {get set}
    var realEstateAgentName: String {get set}
    // he did this
    // func printSummary()
}

extension Building {
    func printSalesSummary() {
        print("For Sale: \(type)")
        print("number of rooms: \(numRooms)")
        print("cost: \(cost)")
        print("agent: \(realEstateAgentName)")
    }
}

struct House: Building {
    let type = "House"
    var numRooms = 2
    var cost = 1000
    var realEstateAgentName: String = "fonvill morsey"
}

struct Office: Building {
    let type = "Office"
    var numRooms: Int
    var realEstateAgentName: String
    var cost: Int
}

var myHouse = House()
myHouse.printSalesSummary()
// notice here we use the default initializer
var myWork = Office(numRooms: 10, realEstateAgentName: "21 century", cost: 10_000)
myWork.printSalesSummary()

