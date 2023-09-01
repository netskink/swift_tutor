//
// day 6
// https://www.hackingwithswift.com/100/swiftui

// Loops
//   for
//   while
//   break and continue



//
// for
//

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("swift works great on \(os)!")
}

for i in 1...5 {
    print(i)
}


for i in 1...5 {
    for j in 1...5 {
        print("   \(i) x \(j) = \(i*j)")
    }
    
    print()
}

// if you don't care about loop variable use _
for _ in 1...3 {
    print("yo")
}

// not really a loop but a range trick using arrays
// This skips the first one and does all the rest
// without stating the last one explicitly
print(platforms[1...])


//
// while loops
//

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var count = 0
var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    count += 1
}

print("it took \(count) rolls to get \(roll)")


//
// break and continue
//


let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}


let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)


// labeled statements allow us to break out of inner loops
let options = ["up", "down", "left", "right"]

let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}


// checkpoint fiz buzz

var counter = 1

while counter < 101 {
    if counter % 3 == 0 {
        print("\(counter) fiz")
    }
    if counter % 5 == 0 {
        print("\(counter) buzz")
    }
    counter += 1
}
