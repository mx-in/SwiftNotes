//: [Previous](@previous)

//: # Control Flow


//: ## For-In Loops

let letter = "hello everyone"

for char in letter.characters {
    print(char)
}

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}


//: ignore 
let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")


//: Range Operators

let minutes = 60
for tickMark in 0..<minutes {
    
}

//: Stride

let minuteInterval = 5

for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}

//: ## While Loops

//: A while loop performs a set of statement until a condition becomes false.
/*: swift provides twp kind of while loops:
    * while evaluates its condition at the start of each pass throught the loop.
    * repeat-while evaluates its condition at the end of each pass throught the loop.
 */

//: ### While

//while <#condition#> {
//    <#code#>
//}


//: ### Repeat-While

//repeat {
//   //statement
//} while <#condition#>


//: ## If 


//: ## Switch

/*:
 * break is not reauired in Swift.
 * The body of each case must contain at least one executable statement.
 */

let anotherCharacter: Character = "a"

switch anotherCharacter {
case "a", "A":
    print("The letter A")
    
default:
    print("Not the letter A")
}

//: ### Interval Matching
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 12..<100:
    naturalCount = "several"
case 100..<1000:
    naturalCount = "hunderds of"
default:
    naturalCount = "many"
}

//: Tuples
//: underscore character (_) , to mach any possible value.

let somePoint = (0, 0)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is out of the box")
}

//: ## Value Bindings

let anotherPoint = (2, 0)

switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("some else at (\(x), \(y))")
    
}
//: the final case matches all possiable remaining values, and so a default case is not needed to make the switch statement exhaustive

//: ## Where
//: A switch case can use a **where** clause to check for additional conditions.
let yetAnotherPoint = (1, -1)

switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x = y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x = -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//: ### Compound Case

let someCharacter: Character = "e"

switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is vowel")
default:
    print("")
}

let stillAnotherPoint = (9, 0)

switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance)")
default:
     print("Not on an axis")
}

//: ## Control Transfer Statement
/*:
 * continue
 * break
 * fallthrough
 * return
 * throw
 */

//: ### fallthrough

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

/*:
 NOTE
 
 The fallthrough keyword does not check the case conditions for the switch case that it causes execution to fall into. The fallthrough keyword simply causes code execution to move directly to the statements inside the next case (or default case) block, as in C’s standard switch statement behavior.
 */

//: ### Labeled Statements
/*
 label name: while condition {
 
     statements
 
 }
 */


//: ## Early Exit

//: ### guard
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
//: The branch must transfer control to exit this block
//: It can do with transfer statement such return, break, continue, or throw
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    
    for _ in 0..<1 {
        guard let _ = person["location"] else {
            print("I hope the weather is nice near you")
            break // or continue
        }
    }
    
    print("I hope the weather is nice in \(location)")
}

greet(person: ["name": "mx"])
greet(person: ["name": "mx", "location": "tianjin"])


//: ## Checking API Availability
if #available(iOS 10, macOS 10.2,*) {
    
} else {
    
}







//: [Next](@next)
