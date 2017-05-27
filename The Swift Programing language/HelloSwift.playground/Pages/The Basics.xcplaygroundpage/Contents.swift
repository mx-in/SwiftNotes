//: [Previous](@previous) startTour


//: advoid use keywords as name unless you hao absolutely no choice
let `let` = "hello world"

print(1...5)
print(1,23, separator: "  ", terminator: ";")

debugPrint("DebugPring")

//: ## Swift is a type-safe language

//: ## Swift always choose Double (rather than float) when inferring the type of floating-point numbers.

//: ## Numberic Literals
/*: 
 * A decimal number, with no prefix
 * A binary number, with a 0b prefix
 * An octal number, with a 0o prefix
 * A hexadecimal number, with a 0x prefix
 
 * 1.25e2 means 1.25 x 10^2, or 125.0.
 * 1.25e-2 means 1.25 x 10^-2, or 0.0125.
 * 
 * 0xFp2 means 15 x 2^2, or 60.0.
 * 0xFp-2 means 15 x 2^-2, or 3.75.
 
 */

//: ** Integer Conversion

//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//: conversions between integer and floating-point numeric types must be made explicit.
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)

//: The literral values can be added directly, because number literals do not have an explicit type in and themselves. They type is inferred only at the point that they are evaluated by the complier.
let literalCombine = 1 + 0.1415

//: ## Type Aliases
//: > Type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword.

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

//: ## Booleans
//: Swift has a basic **Bollean** type, called Bool
//: Boolean values are referred to as logical.


//: ## Tuples

let http404Error = (404, "Not Found")
let status = http404Error.0
let describe = http404Error.1

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (jsutTheStatusCode, _) = http404Error
print("The status code is \(jsutTheStatusCode)")

let http200Status = (statusCode: 200, description: "OK")
let the200Status = http200Status.statusCode
let the200Descirption = http200Status.description

//: ## Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)


//: ## nil
/*: 
 * nil used with optional constants and vairables.
 * if you define an optional variable without providing a default value, the variable is automatically set to nil.
 * Swift's nil is not the same as nil in Objc. In Objc nil is a pointer to nonexistent object. In Swift nil is not a pointer-it is the absence of a value of a certain type.
 * Optionals of any type can be set to nil, not just object types.
 */

if convertedNumber != nil {
    print("convertedNumber ha an integer value of \(convertedNumber!)")
}

//: Optional Binding
if let num = convertedNumber {
    print(num)
}

// the relationg between bindings an boolean condition is &
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

//: Implicityly Unwarpped Optionals
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicity unwrapped optional string."
let implicitString: String = assumedString

//: If an implicitly unwrapped optional is nil and you try to access its wrapped value, you'll trigger a runtime error

//: ## Error Handling
do {
//    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

//: ## Assertions






//: [Next](@next)
