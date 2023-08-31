//
// day 4
// https://www.hackingwithswift.com/100/swiftui

// Type Annotations
//
//
//


//
// Type Annotations
//

var soda: [String] = ["coke","pepsi","barqs"]
var emptyArray: [String] = [String]()
var anotherEmptyArray: [String] = []
var yaEmptyArray = [String]()

let surname: String = "lasso"
let count: Double = 1
let aDict: [String: String] = ["key":"value"]
let aSet: Set<String> = Set(["john", "paul"])

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
style = .light


//
// checkpoint
//

var arrayOfStrings: [String] = [String]()
arrayOfStrings.append("John")
arrayOfStrings.append("Fred")
arrayOfStrings.append("Davis")
arrayOfStrings.append("John")
print("num items in array is \(arrayOfStrings.count)")
let setOfStrings: Set<String> = Set(arrayOfStrings)
print("num unique items is \(setOfStrings.count)")
