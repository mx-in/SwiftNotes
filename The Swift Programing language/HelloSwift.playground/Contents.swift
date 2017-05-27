//: Playground - noun: a place where people can play

print("Hello, world")

//simple value
let explictFloat: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

var optionName: String? = "mx"
var greeting = "Hello!"

if let name = optionName {
    greeting = "Hello, \(name)"
}

//??
let nickName: String? = nil
let fullName: String = "John Appleseed"

let informalGreeting = "Hi \(nickName ?? fullName)"

//switch
let vegetable = "red pepper"

switch vegetable {
case "celevy":
    print("Add some raising")
case let x where x.hasPrefix("red"):
    print("there has a red")
    
default:
    print("every thing tastes good in soup")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]


//dictionary iterate
var largest = 0
var kindName: String?;

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            kindName = kind
        }
    }
}
print(largest, "\(kindName!)")

//..< omits its upper value
var total = 0
for i in 0..<4 {
    total += i
}
print(total)

//... make a range includes both value
var bothTotal = 0
for i in 0...4 {
    bothTotal += i
}
print(bothTotal)

//func
func greet(person: String, today: String) -> String {
    return "Hello \(person), today is \(today)."
}

greet(person: "Mike", today: "Wednsday")

//variable number of arguments
func average(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum  += number
    }
    
    return sum/numbers.count
}

print(average(numbers: 1, 2, 3))

//nested function
func returnFifteen() -> Int {
    var y = 10
    
    func add() {
        y += 5
    }
    
    add()
    
    return y
}

//Function
//Function are fist-class type, you can generate a func by the another func
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return number + 1
    }
    
    return addOne
}

var increment = makeIncrementer()
print(increment(1))

func addTo(_ adder: Int) -> ((Int) -> Int) {
    return {
        num in
        return num + adder
    }
}

let addTwo = addTo(2)
let addThree = addTo(3)

print(addTwo(3))
print(addThree(3))

func greatThan(_ comparer: Int) -> ((Int) -> Bool) {
    return { $0 > comparer}
}

let greatThanTen = greatThan(10)
greatThanTen(3)

//func can take another function as one of its arguements
func hasAnyMacthes(list: [Int], condition:(Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

let greatThanSeven = greatThan(7)
var numbers = [20, 19, 1, 2,]
hasAnyMacthes(list: numbers, condition: greatThanTen)

// Use in to separate the arguements and return type from body
numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})

numbers.map({(number: Int) -> Int in
    if number%2 == 0 {
        return 3 * number
    } else {
        return 0
    }
})

//When a closure's type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both
let mappedNumbers = numbers.map({
    number in 3 * number
})
print(mappedNumbers)


let sortedNumbers = numbers.sorted
    {$0 > $1}
print(sortedNumbers)


// Object and Classes
// Every property needs a value assigned-either in its declaration
class Shape {
    var numberOfSides = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var trangle = Shape(name: "trangle")
trangle.numberOfSides = 3
trangle.simpleDescription()

class Square: Shape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

class Circle: Shape {
    var redius: Double
    
    init(redius: Double, name: String) {
        self.redius = redius
        super.init(name: name)
        numberOfSides = 1
    }
    
    func area() -> Double {
        return Double.pi * redius * redius
    }
    
    override func simpleDescription() -> String {
        return "A circle with redius \(redius)."
    }
}
var circle = Circle(redius: 10, name: "bingoCircle")
circle.simpleDescription()

/*: smme text
 # Table of content
 
 * [likely link](likely link)
 
 */

//: line of markup


