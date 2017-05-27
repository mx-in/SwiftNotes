//: [Previous](@previous)

//: # Class and Structures

//: ## Comparing Classes and Structures
/*: 
 ### Common
 * Define properties to store values
 * Define methods to provide functionality
 * Define subscripts to provide access values using subscript syntax
 * Define initializers to set up their initial state
 * Be extended to expand their functionality beyond a default implementation
 * Comform to protocols to provide standard functionality of a certain kind
 */

/*:
 ### Class have & Structures not
 * Inheritance enables one class to inherit the characteristics of another.
 * Type casting enables you to check and interpret the type of class instace at runtime.
 * Deinitializers enable an instance of a class to free up any resources it has assigned.
 * Reference counting allows more than one reference to a class instance.
 */

//: ## Note: Structures are always copied when they passed around in you code, and do not use reference counting.

//: ## Define 

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//: ## Class and Structure Instance

let someResolution = Resolution()
let someVideoModel = VideoMode()

//: ## Accessing Properties

print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoModel is \(someVideoModel.resolution.width)")

someVideoModel.resolution.width = 1280

//: ## All structures have an automatically-generated memberwise initializer, and class instace do not receive a default memberwise initalizer.

let vga = Resolution(width: 640, height: 480)

//: ## Structures and Enumerations Are Value Types -- whose value is copied when it is assigned to a variable or constant, or when it pass to a function
//: ## All of the basic types type in swift -- integers, floating-point numbers, Booleans ... are value type , and are implemented as structures behind the scenes

let hd = Resolution(width: 1920, height: 1080)

var cinema = hd // copy

//: ## Classes Are Reference Types

/*:
 ## Identify Operators: Use to check weather two constants or vairables refer to the same single instance
 * Identical to (===)
 * Not Identical to (!==)
 */



//: Pointers defined like any other constant or vairiable in Swfit.


//: ## Choosing Between Classes an Structures
/*: 
 * The structure’s primary purpose is to encapsulate a few relatively simple data values.
 * It is reasonable to expect that the encapsulated values will be copied rather than referenced when you assign or pass around an instance of that structure.
 * Any properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced.
  * The structure does not need to inherit properties or behavior from another existing type.
 
 */


//: ## Assignment and Copy Behavior for Strings, Arrays, and Dictionaries


















//: [Next](@next)
