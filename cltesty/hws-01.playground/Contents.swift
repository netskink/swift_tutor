import Cocoa

// 100 days of swiftUI
// https://www.hackingwithswift.com/100/swiftui
// day 1

// make variable
var greeting = "Hello, playground"
greeting = "yo"

// make constant
let me = "John"

print(greeting, me)

let myLongString = """
line 1
line 2
line 3
"""

// num chars
print(myLongString.count)

myLongString.uppercased()

myLongString.hasPrefix("li")
myLongString.hasSuffix("3")

// whole numbers
let myBigNum = 1_000_000_000

var counter = 10
// compound operator to add
counter += 5

counter.isMultiple(of: 3)

// floating point (double) numbers
var fpNum = 3.14
fpNum *= 2

fpNum = fpNum + Double(19)

// cgfloat is same as Double
// cg is core graphics


