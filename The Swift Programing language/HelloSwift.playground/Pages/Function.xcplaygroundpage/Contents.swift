//: [Previous](@previous)

//: # Function

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}

func printWithoutCount(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "Hello World")
printWithoutCount(string: "Hello World")

//: Return value can be ignored 

//: ## Functions with Multiple Return Values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value > currentMax {
            currentMax = value
        } else if value < currentMin {
            currentMin = value
        }
    }
    
    return(currentMin, currentMax)
}

let bounds = minMax(array: [1, 2, ])
print("min is \(bounds.min) max is \(bounds.max)")

//: ## Optional Tuple Return Types

//: returned tuple will be nil if, array pram is nil or empty
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value > currentMax {
            currentMax = value
        } else if value < currentMin {
            currentMin = value
        }
    }
    
    return(currentMin, currentMax)
}

if let bounds = minMax2(array: [1, 2, ]){
    print("min is \(bounds.min) max is \(bounds.max)")
}


//: ## Function Argument Label and Parameters Name
//: The argument label is used when calling function
//: The Parameter name is used in the implementation of function.
//: By default, parameters use their parameter name as thire arguement label.

//: ## Specifying Argument Labels
//: Write an arguement label before the parameter name, separated by a space:
func someFunction(arguementLabel parameterName: Int) {
    
}

func greet(person: String, from homeTown: String) -> String{
     return "Hello \(person)!, Gald you could visit from \(homeTown)"
}

//: ## Omitting Argument Labels
func anotherFunction(_ firstParameterName: Int, secondParameterName: Int) {
    
}
anotherFunction(1, secondParameterName: 2)

//: ## Default Parameter Values

//: If a default valued is defined, you can omit that parameter when calling the function.

func thisIsAFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    
}

thisIsAFunction(parameterWithoutDefault: 1, parameterWithDefault: 2)
thisIsAFunction(parameterWithoutDefault: 2)

//: Parameters that don't have default values are usually more important to the funcxtion's meanning--writing them first makes it esaier to recognize

//: ## Variadic Parameters
func arithmeticMean(_ numers: Double...) -> Double {
    var total: Double = 0
    for number in numers {
        total += number
    }
    
    return total/Double(numers.count)
}
//: **numbers** is type of [Double]

//: A function may have at most one variadic parameter

//: ## In-Out Parameters
//: Function parameters are constants by default. Trying to change the value of a function parameter from within the body of that function results in a complie-time error.

//: An in-out parameter by placing the inout keyword right before a parameter's type, it has a value that is passed in to the function, is modified by the function, and is passed back out of the function to replace the original value.

/*: Note:
    In-out parameters cannot have default values, and variadic parameters cannot be marked as inout
 */

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b;
    b = temporaryA
}

var someInt = 3
var anotherInt = 111

swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//: ## Function Types
//: Every function has a specific function type.

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInt(_ a: Int, _ b: Int) -> Int {
    return a * b
}
//: The type of both of functions is (Int, Int) -> Int
//: It can be read as :
//: "A function that has two parameters, both of type Int, and that returns a value of type Int."

//: () -> Void
func pfintHelloWorld() {
    print("Hello, world")
}

//: ## Using Function Types
var mathFunction: (Int, Int) -> Int = addTwoInts
//: This can be read as: "Define a variable called mathFunction, which have a type of a function that take two Int values, and returns an Int value
print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInt
print("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts
// anotherMathFunction is infered to be of type (Int, Int) -> Int

//: ## Function Types as Parameter Types
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

//: ## Function Types as Return Types
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}

//: ## Nested Functions
//: Nested functions are hidden from the outside world by default, but can till be called and used by their enclosing function. An enclosing function can also return one of its nested functions.

func chooseAnotherStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackWard(input: Int) -> Int {
        return input - 1
    }
    
    return backward ? stepBackward : stepForward
}

var anotherCurrentValue = -4

let anotherMoveNearerToZero = chooseAnotherStepFunction(backward: anotherCurrentValue > 0)

while anotherCurrentValue != 0 {
    print("Another \(anotherCurrentValue)")
    anotherCurrentValue = anotherMoveNearerToZero(anotherCurrentValue)
}


//: [Next](@next)
