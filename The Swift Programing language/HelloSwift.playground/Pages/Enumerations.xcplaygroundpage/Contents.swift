//: [Previous](@previous)

//: # Enumerations

//: ## Emueration Synatx
enum SomeEnumertion { // Start with capital letter
    
}

enum CompassPoint {
    case north
    case south
    case west
    case east
}
//: Swift enumeration cases are not assigned a default integer value when they are careted.

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west

directionToHead = .east
//: The type of directionToHead is already known, and so you can drop the type when setting its value


//: ## Matching Enumeration Values with a Switch Statement

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rise")
case .west:
    print("Where the skies are blue")
}

//: ## Associate Values

enum Barcode {
    case upc(Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 512)
productBarcode = .qrCode("ADSFASDFASDFADFS")

//: Extract associated values
switch productBarcode {
case .upc(var numberSystem, let manufacturer, let product):
    print("UPC: \(numberSystem), \(manufacturer), \(product)")
case .qrCode(let productCode):
    print("QRCode \(productCode)")
}

switch productBarcode {
case let .upc(numberSystem, manufacturer, product):
    print("UPC: \(numberSystem), \(manufacturer), \(product)")
case let .qrCode(productCode):
    print("QRCode \(productCode)")
}

//: ## Raw Values
// enumeration cases can come prepopulated with default (called raw values), which are all of the same type.
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
//: Raw values can be any types. Each raw value must bu unique whithin its enumeration declaration
//: Raw value are not same as associated values. Raw values are set to prepopulated vaue when you first define the enumeration in your code, The raw value for a practicular enumeration case is always the same. Associated values are set when you create a new constant or variable base on one of the enumeration's case, and can be different each time you do so.

//: ## Implicitly Assigned Raw Values
enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn
}

enum CompassPoint2: String {
    case north, south, west, east
}
//: CompassPoint2.south has an implicit raw value of "south", and so on

//: ### Access the rawValue
let earthOrder = Planet2.earth.rawValue
let sunsetDirection = CompassPoint2.west


//: ## Initializing from a Raw Value
//: If you defined an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value's type, and returns either an enumeration case or nil (an optional enumeration case).

let possiblePlanet = Planet2(rawValue: 7)

let positionToFind = 11
if let somePlant = Planet2(rawValue: positionToFind) {
    switch somePlant {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at postion \(positionToFind)")
}

//: ## Recurisive Enumerations
//: A recurisive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing **indirect** before it

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//: another style

indirect enum
    ArithmeticExpression2 {
    
    case number(Int)
    case addition(ArithmeticExpression2, ArithmeticExpression2)
    case multiplication(ArithmeticExpression2, ArithmeticExpression2)
    
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(five, four)

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

//: [Next](@next)
