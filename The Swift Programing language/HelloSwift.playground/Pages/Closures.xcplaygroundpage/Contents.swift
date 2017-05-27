//: [Previous](@previous)

//: # Closures

//: Closures can capture and store references to any constants and variables from the context in which their defined.
/*: Closure take one of three forms:
 * Clobal functions are closures that have a name and do not capture any values.
 * Nested functions are closures that have a name and can capture values from their enclosing function.
 * Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
 */

/*: 
 Swift Closure optimizations:
 * Inferring parameter and return value types from context
 * Implicit reurn from single-expression closures
 * Shorthand arguement names
 * Trailing closure syntax
 */

//: ## Closure Expressions
//: Closure Expressions are a way to write inline closures in a brief, focused syntax.

//: ## The Sorted Method

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//: The sorted by method accepts a closure that takes two arguements of the same type as the array's contents, and return a Bool value to whether the first value should appear before after the second value once the values are sorted.
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

//: ## Closure Expression Syntax
//: Closure expression synatx has the following general form:
//{ (parmeters) -> return type in
//    statement
//}
//: The parameters in closure expression syntax can be in-out parameters, but they can't have a default value. Variadic parameters can be used if you name the variadic parameter. Tuples can also be used as parameter types and return types.

reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})
//: For the inline closure expression , the parameters and return type are written inside the curly braces, not outside of them.
//: The start of the closure's body is introduced by **in** keyword 

//: ## Inferring Type From Context
//: Because the sorting closure is passed as an arguement to a method, Swift can infer the type of its parameters and the type of the value it returns.
//: Because all of the types can be inferred, the return arrow and the parentheses around the paramenters can also be ommitted:

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

//: ## Implicit Returns from Single-Expression Closure
//: Single-expression closure closures can implicitly return the result of their single expression by omitting the return keyword from their delaration
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

//: ## Shorthand Argument Names
//: Swift automatically provides shorthand argument names to inline closures, which can be used refer to the values of the closure's arguments by the names $0,$1,$2, and so on.
reversedNames = names.sorted(by: { $0 > $1 })
//: Here $0, $1 refer to the closure's first and second String arguments

//: ## Operator Methods
//: Swift's String type defines its string-specific implementation of the great-than operator (>) as a method that has two parameters of String and return a value of type Bool. This exactly matches the method type needed by the sorted(by:) method
reversedNames = names.sorted(by: >)

//: ## Trailing Closures
func someFunctionThatTakeAClosure(closure: () -> Void) {
    
}

someFunctionThatTakeAClosure (closure: {
    
})

someFunctionThatTakeAClosure () {
    
}

reversedNames = names.sorted() {
    $0 > $1
}

//: If a closure expression is provided as the function or method's **only arguement** and you provide the expression as trailing closure, you do not need to write a pair of parenttheses() after the function or method's name when you call the function:
reversedNames = names.sorted {
    $0 > $1
}


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map {
                (number) -> String in // input parameter type can be inferred from the value in array
    var number = number
    var output = ""
    
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while  number > 0
    
    return output
}

//: ## Capturing Values
//: A closure can capture constants an variables from the surrounding context in which it is defined.
//: The closure can then refer to an modify the values of those constant and variables from within its body, even if the original scope that defined the constants an variable no longer exists

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementer() -> Int {
        runningTotal += amount // capturing a reference to runningTotal and amount
        return runningTotal
    }
    
    return incrementer
}

/*:
 As an optimization, Swift may instead capture and store a copy of a value if that value is not mutated by a closure, and if the value is not mutated after the closure is created.
 Swift also handles all memory management involved in disposing of variables when they are no longer needed
 */

let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()

incrementByTen()

incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)

incrementBySeven()

incrementByTen()

/*:
 If you assign a closure to a property of a class instance, and the closure captures that instance by referring to the instance or its members, you will create a strong reference cycle between the closure and the instance. Swift uses capture lists to break these strong reference cycles. For more information, see Strong Reference Cycles for Closures.
 
 */

//: ## Clasures Are Reference Types
//: In the example above, **incrementBySeven** and **incrementByTen** are constants, but closures these constants refer to are still able to increment the **runningTotal** variables that they have captured. This is because functions and closures are **reference types**.

//: You are actually setting that constant or variable to be reference to the function of closure

//: This also mean that if you assign a closure to two different constants or variables, both of those constants or variables will refer to the same closure:
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()


//: ## Escaping Closures
//: A closure is said to **escape** a function when the closure is passed as an argument to the function, but is called afterr the function returns. 
//: When you declare a function that takes a closure as one of its parameters, you can write **@escaping** before the parameter's type to indicate that the closure is allowed to escape

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClo(completion: @escaping () -> Void) {
    completionHandlers.append(completion)
}
//: Marking a closure with @escaping means you have to refer to self explictly within the closure
func someFunctionWithNonesacpe(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        
        someFunctionWithEscapingClo { // @escaping means you have to refer to self explicity within the closure
            self.x = 100
        }
        
        someFunctionWithNonesacpe {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

//: ## Autoclosures
//: An **autoclosure** is a closure that automatically created to warp an expression that's being passed as an arguement to a function. It's doesn's take any arguments, and when it's called, it returns the value of the expression that's  warpped inside of it. 
//: This syntactic convenience lets you omit braces around function's parameter by writing a normal expression instead of an explicit closure

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella", "Anna"]
print(customersInLine.count)

let customerProvider = {
    customersInLine.remove(at: 0)
}
print(customersInLine.count)

print("Now Seving \(customerProvider())!") // An autoclosure lets you delay evaluation

print(customersInLine.count)


func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: { customersInLine.remove(at: 0) })
serve {customersInLine.remove(at: 0)}

//: ### @autoclosure

func autoclosureServer(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

autoclosureServer(customer: customersInLine.remove(at: 0))

/*:
 Overusing autoclosures can make your code hard to understand. The context and function name should make it clear that evaluation is being deferred.
 */

//: ## @autoclosure and @escaping

var customerProviders: [() -> String] = []
func collectCustomerProvider(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProvider(customersInLine.remove(at: 0))
collectCustomerProvider(customersInLine.remove(at: 0))

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())")
}







//: [Next](@next)
