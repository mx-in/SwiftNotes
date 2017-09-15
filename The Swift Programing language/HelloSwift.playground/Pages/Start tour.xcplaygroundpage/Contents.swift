//: # Start swift tour

print("Hello, world")

//: ## simple value
let explictFloat: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

var optionName: String? = "mx"
var greeting = "Hello!"

if let name = optionName {
    greeting = "Hello, \(name)"
}

//:??
let nickName: String? = nil
let fullName: String = "John Appleseed"

let informalGreeting = "Hi \(nickName ?? fullName)"

// ## Control Flow

//:switch
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


//: dictionary iterate
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

//:..< omits its upper value
var total = 0
for i in 0..<4 {
    total += i
}
print(total)

//:... make a range includes both value
var bothTotal = 0
for i in 0...4 {
    bothTotal += i
}
print(bothTotal)

//: ## func
func greet(person: String, today: String) -> String {
    return "Hello \(person), today is \(today)."
}

greet(person: "Mike", today: "Wednsday")

//:variable number of arguments
func average(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum  += number
    }
    
    return sum/numbers.count
}

print(average(numbers: 1, 2, 3))

//:nested function
func returnFifteen() -> Int {
    var y = 10
    
    func add() {
        y += 5
    }
    
    add()
    
    return y
}

//: **Function** are fist-class type, you can generate a func by the another func
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

//:func can take another function as one of its arguements
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

//: Use **in** to separate the arguements and return type from body
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

//: When a closure's type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both.
let mappedNumbers = numbers.map({
    number in 3 * number
})
print(mappedNumbers)


let sortedNumbers = numbers.sorted
    {$0 > $1}
print(sortedNumbers)


//: ## Object and Classes
//: Every property needs a value assigned-either in its declaration or in the initilizer.

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

/*:
 **initilizer has three different step**:
 1. Setting the value of properties that the subclass declares.
 1. Call the superclass's initializer.
 1. Changing the value of properties defined by the superclass. Any additional setup work that uses method, getters, or setters can also be done at this point.
 */

//: willSet didSet
//: The code you provide is run any time the value changes outside of an initializer
class CircleAndSquare {
    var circle: Circle {
        willSet {
            square.sideLength = newValue.redius
        }
    }
    
    var square: Square {
        willSet {
            circle.redius = newValue.sideLength
        }
    }
    
    init(redius: Double, name: String) {
        circle = Circle(redius: redius, name: name)
        square = Square(sideLength: redius, name: name)
    }
}

//: ## Work with option value
//: If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil.

//: You use the Optional type whenever you use optional values, even if you never type the word Optional. Swift’s type system usually shows the wrapped type’s name with a trailing question mark (?) instead of showing the full type name. For example, if a variable has the type Int?, that’s just another way of writing Optional<Int>. The shortened form is preferred for ease of reading and writing code.

let shortForm: Int? = Int("42")
let longForm: Optional<Int> = Int("42")

//: The Optional type is an enumeration with two case. **Optional.none** is equivalent to the nil literal, Optional.some(wrapped) stored a wrapped value.

let number: Int? = Optional.some(42)
let noNumber: Int? = Optional.none
print(noNumber == nil)

var imagePaths = ["star": "/glyphs/star.png",
                  "portrait": "/images/content/portrait.jpg",
                  "spacer": "/images/shared/spacer.gif"]
imagePaths["star"]?.append("hello")

//: To safely access the properties and methods of a wrapped instance, use the postfix optional chaining operator (?).
if let _ = imagePaths["star"]?.hasSuffix(".png") {
    print("The star image is in PNG format")
}


//: ## Enumerations
//: By default, Swift assigns the raw values starting at zero and incrementing by one each time, but “you can change this behavior by explicitly specifying values.

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescirption() -> String {
        switch self {
        case .ace:
            return "ace"
            
        case .jack:
            return "jack"
            
        case .queen:
            return "queen"
            
        case .king:
            return "king"
            
        default:
            return String(self.rawValue)
        }
    }
    
    func compare(rank: Rank) -> Rank {
        
        if rank.rawValue > self.rawValue {
            return rank
        }
        return self
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue
let nineRawValue = Rank.nine.rawValue

let king = Rank.king

ace.compare(rank: king)

let rankFive = Rank(rawValue: 5)

enum Suit: Int {
    case spades = 1
    case hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
            
        case .hearts:
            return "hearts"
            
        case .diamonds:
            return "dimonds"
            
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}

//: Another choice for enumeration cases is to have values associated with the case—these values are determined when you make the instance, and they can be different for each instance of an enumeration case


enum ServerResponse {
    case result(String, String)
    case failure(String)
    case timeout
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("out of cheese.")
let timeout = ServerResponse.timeout

switch success {
case let .result(sunrise, sunset):
    print("Sunrise at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
case .timeout:
    print("Time out")
}

//: Struct
//: **Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.**

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescirption()) of \(suit.simpleDescription())"
    }
    
    static func fullDeckCards() -> Array<Card>{
        
        let cardsCount: Int = 13
        let suitCount: Int = 4
        var cards = [Card]()
        
        for i in 1 ... cardsCount {
            for j in 1 ... suitCount {
               cards.append(Card(rank: Rank(rawValue:i)!, suit:Suit(rawValue: j)!))
            }
        }
        
        return cards
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescirption = threeOfSpades.simpleDescription()

let cards = Card.fullDeckCards()

//for card in cards {
//    print(card.rank, card.suit)
//}

//: ## Protocols and Extensions
//: **Classes, enumerations, and structs can all adopt protocols**

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple Structure"
    
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
    
}

enum SimpleEnum: ExampleProtocol {
    case aCase
    
    var simpleDescription: String { //get only
        return "simple adjust"
    }
    
    mutating func adjust() {
        
    }
}

//: ## EXtension

extension Int: ExampleProtocol {
    
    var simpleDescription: String {
        return "simple adjust"
    }
    
    func adjust() {
        
    }
}

extension Double {
    var absoluteValue: Double {
        if self > 0.0 {
            return self
        }
        else {
            return -1 * self
        }
    }
}

//: ## Error Handling
//: Use **throw** to throw an error and throws to mark a function that can throw an error. if you throw an error in a function, the function returns immediately and the code that called the function handles the error.
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

enum PrinterNoneError: Error {
    case noneError
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    
    if printerName == "other" {
        throw PrinterNoneError.noneError
    }
    
    return "Job send"
}

//: There are several ways to handle errors. One way is to use do-catch. Inside the do block, you mark code that can throw an error by writing try in front of it. Inside the catch block, the error is automatically given the name error unless you give it a different name.
do {
    let printerResponse = try send(job: 104, toPrinter:"Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
    print(printerResponse)
    
} catch PrinterError.onFire {
    print("I'll just put this over here, with rest of the fire.")
    
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
    
} catch {
    print(error)
}

//: try?    
//: > convert the result to an optional. if function throw an error, the specific error is discarded and the result is nil. Otherwise, the result is an optional containging the value taht the function returned.

let printerFailure = try? send(job: 14404, toPrinter: "Never Has Toner")
let printerSuccess = try? send(job: 14123, toPrinter: "lol")

//: defer   
//: > Use defer to write a block of code that is executed after all other code in the function, **just before the function returns**. The code is executed regardless of whether the function throws an error.”

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func firdgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    
    return result
}

firdgeContains("banana")
print(fridgeIsOpen)

//: ## Generics

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    
    return result
}

makeArray(repeating: "Knock", numberOfTimes: 5)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

//: ## where 
//: Use where right before the body to specify a list of requirements
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        
        return false
}

anyCommonElements([1, 2, 3], [3])
        
func commonElementsArray<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Iterator.Element] where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element{
    
    var commonElements: Array<T.Iterator.Element> = []
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem && !commonElements.contains(lhsItem){
                commonElements.append(lhsItem)
            }
        }
    }
    return commonElements
    
}

let commonArray = commonElementsArray([1, 3, 3, 4, 5], [1, 2, 3])

//: [Next](@next) The Basic

