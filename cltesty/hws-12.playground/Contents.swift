//
// day 12
// https://www.hackingwithswift.com/100/swiftui

//
// classes
//
// custom classes
// inheritance
// initializer
// copying classes
// deinitializers
// variables inside classes
//
// checkpoint 7
//



//
// classes
//

// First, the things that classes and structs have in common include:
//
// * You get to create and name them.
// * You can add properties and methods, including property observers and access control.
// * You can create custom initializers to configure new instances however you want.


//However, classes differ from structs in five key places:
//
// * You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
// * Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
// * When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
// * When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
// * Even if you make a class constant, you can still change its properties as long as they are variables.




// exampe class, note changing class to struct and it behaves the same
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


// Classes and structs give Swift developers the ability to create custom, complex
// types with properties and methods, but they have five important differences:
//
// * Classes do not come with synthesized memberwise initializers.
// * One class can be built upon (“inherit from”) another class, gaining its
//   properties and methods.
// * Copies of structs are always unique, whereas copies of classes actually
//   point to the same shared data.
// * Classes have deinitializers, which are methods that are called when an
//   instance of the class is destroyed, but structs do not.
// * Variable properties in constant classes can be modified freely, but variable
//   properties in constant structs cannot.

//
// examples
//

class BoardGame {
    var name: String
    var minimumPlayers = 1
    var maximumPlayers = 4
    init(name: String) {
        self.name = name
    }
}

class TIE {
    var name: String
    var speed: Int
    init(name: String, speed: Int) {
        self.name = name
        self.speed = speed
    }
}
let fighter = TIE(name: "TIE Fighter", speed: 50)
let interceptor = TIE(name: "TIE Interceptor", speed: 70)


class VideoGame {
    var hero: String
    var enemy: String
    init(heroName: String, enemyName: String) {
        self.hero = heroName
        self.enemy = enemyName
    }
}
let monkeyIsland = VideoGame(heroName: "Guybrush Threepwood", enemyName: "LeChuck")

// Because the parameters and properties have the same names, Swift requires that we use self. to distinguish the properties.
//class Image {
//    var filename: String
//    var isAnimated: Bool
//    init(filename: String, isAnimated: Bool) {
//        filename = filename
//        isAnimated = isAnimated
//    }
//}


//
// inheritance
//

class Employee {
    let hours: Int
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }

    init(hours: Int) {
        self.hours = hours
    }
}

// note use of override on printSummary()
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

// NOTE: use of final on class.  This says this
// class can not be inherited from.
final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}


let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
robert.printSummary()
joseph.work()
joseph.printSummary()


// Tip: If you know for sure that your class should not support inheritance, you can mark it as final. This means the class itself can inherit from other things, but can’t be used to inherit from – no child class can use a final class as its parent.

//
// initializer
//


class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric:Bool,  isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// could also do this to avoid having to init isElectric

class Vehicle2 {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car2: Vehicle2 {
    let isConvertible: Bool = false

}
let maxima = Car2(isElectric: false)
maxima.isConvertible
maxima.isElectric

//
// example
//

class Vehicle3 {
    var wheels: Int
    init(wheels: Int) {
        self.wheels = wheels
    }
}
class Truck: Vehicle3 {
    var goodsCapacity: Int
    init(wheels: Int, goodsCapacity: Int) {
        self.goodsCapacity = goodsCapacity
        super.init(wheels: wheels)
    }
}

class Student {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class UniversityStudent: Student {
    var annualFees: Int
    init(name: String, annualFees: Int) {
        self.annualFees = annualFees
        super.init(name: name)
    }
}

//
// copy classes vs copy structs
//

struct SUser {
    var username = "Anonymous"
}

// structs don't share data
var suser = SUser()
var susercopy = suser
suser.username = "john"
suser.username
susercopy.username


class CUser {
    var username = "Anonymous"
}

// classes share data
var cuser = CUser()
var cusercopy = cuser
cuser.username = "john"
cuser.username
cusercopy.username


// get around shared data with copy method

class CUser2 {
    var username = "Anonymous"
    func copy() -> CUser2 {
        let user = CUser2()
        user.username = username
        return user
    }
}

// classes share data
var cuser2 = CUser2()
var cusercopy2 = cuser2.copy()
cuser2.username = "john"
cuser2.username
cusercopy2.username

//
// deintializers
//
//
//This comes with a few small provisos:
//
//Just like initializers, you don’t use func with deinitializers – they are special.
//Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
//Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
//We never call deinitializers directly; they are handled automatically by the system.
//Structs don’t have deinitializers, because you can’t copy them.


class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}


for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}


var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")


//
// structs and classes properties
//

//One of the small but important differences between structs and classes is the way they handle mutability of properties:
//
//Variable classes can have variable properties changed
//Constant classes can have variable properties changed
//Variable structs can have variable properties changed
//Constant structs cannot have variable properties changed


//
// checkpoint
//

// Your challenge is this:
//    make a class hierarchy for animals,
//      starting with Animal at the top,
//      then Dog and Cat as subclasses,
//      then Corgi and Poodle as subclasses of Dog,
//      and Persian and Lion as subclasses of Cat.
//
// But there’s more:
//
// The Animal class should have a legs integer property that tracks how many legs the animal has.
//
// The Dog class should have a speak() method that prints a generic dog barking string,
// but each of the subclasses should print something slightly different.
//
// The Cat class should have a matching speak() method,
// again with each subclass printing something different.
//
// The Cat class should have an isTame Boolean property, provided using an initializer.
// I’ll provide some hints in a moment, but first I recommend you go ahead and try it yourself.
//
                                                    
                                                    
class Animal {
    let legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("whoof")
    }
    init() {
        super.init(legs: 4)
    }
}
class Corgi: Dog {
    override func speak() {
        print("small whoof")
    }
}
class Poodle: Dog {
    override func speak() {
        print("large whoof")
    }
}
class Cat: Animal {
    var isTame: Bool
    func speak() {
        print("meow")
    }
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}
class Persian: Cat {
    override func speak() {
        print("large meow")
    }
    init() {
        super.init(isTame: true)
    }
}
class Lion: Cat {
    override func speak() {
        print("roar")
    }
    init() {
        super.init(isTame: false)
    }
}

let max = Persian()
max.speak()
max.legs
max.isTame

let simba = Lion()
simba.speak()
simba.legs
simba.isTame
