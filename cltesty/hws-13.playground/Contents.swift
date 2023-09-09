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

