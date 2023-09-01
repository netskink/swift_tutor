//
// day 5
// https://www.hackingwithswift.com/100/swiftui

//
// conditions
// if
// switch
// ternary conditional operator

let somecondition: Bool = true

if somecondition {
    print("somecondition is true")
}

let speed = 88
let percentage = 85
let age = 18

if speed > 85 {
    print("where we are going we don't need roads.")
}

if percentage < 60 {
    print("sorry you failed the test.")
}

if age >= 18 {
    print("you can vote!")
}

let myName = "john"
let friendsName = "superman"

if friendsName < myName {
    print("\(friendsName) then \(myName)")
} else {
    print("\(myName) then \(friendsName)")
}


// a simple queue

var numbers: [Int] = [1,2,3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)


enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.medium

if first < second {
    print("small is less than medium")
}

enum TransportOption {
    case car, bike, bus, airplane
}

let transport = TransportOption.car

if transport == .bike {
    print("take the bike path")
} else if transport == .car || transport == .bus {
    print("get on the highway")
} else {
    print("fly away")
}


// switch
// no break. it breaks by default
// must have case for all possible values

switch transport {
case .car:
    fallthrough
case .bus:
    print("get on the road")
case .airplane:
    print("fly away")
case .bike:
    print("take the bike path")
}

var place = "cary"

switch place {
case "cary":
    print("You are in nc")
case "new york":
    print("you are in new york ")
default:
    print("unknown location")
}



// conditional ternary operator

let age2 = 18
let canVote = age2 > 18 ? "yes" : "no"


enum Theme {
    case dark, light
}

let theme:Theme = .dark

let background = theme == .dark ? "black" : "white"

print(background)
