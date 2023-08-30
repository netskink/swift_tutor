//
// day 3
// https://www.hackingwithswift.com/100/swiftui

// Arrays
// Dictionaries
// Sets
// Enums


//
// arrays
//

var beatles = ["John", "Paul", "George", "Ringo"]
var numbers = [4, 8, 15, 16, 23, 42]
var temps = [25.3, 28.2, 26.4]

print(beatles[1])

beatles.append("Adrian")

print(beatles)

// Create an array of Integers
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores)



var albums = Array<String>()
albums.append("folklore")
albums.append("Fearless")
albums.append("Red")

// variant
var also = [String]()
also.append("folklore")
also.append("Fearless")
also.append("Red")


var yet = ["folklore"]
yet.append("Fearless")
yet.append("Red")


var characters = ["lana", "pam", "ray", "sterling"]

characters.remove(at: 2)
print(characters.count)
characters.removeAll()
print(characters.count)

let bondMovies = ["casion royale", "spectre", "no time to die"]
print(bondMovies.contains("frozenm"))

print(bondMovies.sorted())


let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()

print(reversedPresidents)



//
// Dictionaries
//

let employee2 = [ "name":"Taylor Swift",
                  "job":"Singer",
                  "location":"Nashville"]

print(employee2["name",default: "unknown"])
print(employee2["job",default: "unknown"])
print(employee2["location",default: "unknown"])
print(employee2["manager",default: "unknown"])

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "london",
    2016: "rio",
    2021: "tokyo"
]
print(olympics[2012, default: "unkown"])

var heights = [String: Int]()
heights["Yao"] = 229
heights["Shaq"] = 216
heights["LeBron"] = 206


let results  = [
    "english": 100,
    "french": 85,
    "geography": 75
]
let historyResult = results["history", default: 0]



//
// Sets
//

let actors = Set([
    "Denzil",
    "Tom",
    "Robert",
    "Nicolas"
])

// Creates set from an array. It will not maintain order since there is none.

print(actors)

// alternate method

var actors2 = Set<String>()

// notice insert vs append as in array
actors2.insert("Denzil")
actors2.insert("Tom")
actors2.insert("Robert")
actors2.insert("Nicolas")



//
// Enums
//

enum WeekDay {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = WeekDay.monday
day = WeekDay.tuesday

// alternative

enum WeekDay2 {
case monday, tuesday, wednesday
case thursday
case friday
}

// shortend asignment

var day2 = WeekDay2.monday
day2 = .thursday

