//: [Previous](@previous)

//: # Properties

//: properties associate values with a particular class, structure, or enumeration.

//: Stored properties
//: store constant an vairable values as part of instance; provide **only by classes and structures**

//: Computed properties
//: computed properties calculate a value; prvide by classes, structures, and enumerations.

//: ## Stored Properties

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 2)
//: ## Store Properties of Constants Structure Instances

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6
//error: cannot assign to property: 'rangeOfFourItems' is a 'let' constant
//: This behaviour is due to structures being **value types**. When an instance of a value type is marked as a constant, so are all of its properties

//: The same is not true for classes, which are reference types. if you assign an instance of a reference typ to a constant, you can still change that isntance's variable properties.

class Test {
    var len: Int? = nil
    let num: Int?
    
    init(num: Int) {
        self.num = num
    }
}

let test = Test(num: 2)
test.len = 3

//: ## Lazy Stored Properties
//: A lazy stored property is a property whose initial value is not calculated until the first time it is used. You indicate a lazy soted property by writing the lazy modifier before its declaration.

/*:
    You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initilization completes, Constant properties must always have a value before initialalization completes, therefore cannot be declared as lazy.
 */

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// importer not been created
print(manager.importer.fileName)
// the DataImporter instance for the importer property has now been created

/*:
 If a property marked with the lazy modifier is accessed by multiple threads simultaneously and the property has not yet been initialized, there is no guarantee that the property will be initialized only once. (!!!Not Thread Safety)
 */

//: ## Stored Properties an instance Variables
//: Comparing with Objc Swift unifies property declaration.

//: ## Computed Properties
//: In addition to stored properties, classes, structures, and enumerations can define **computed properties**, which do not always store a value. Instead, **they provide a getter and an optional setter** to retrieve and set other properties and values indirectly.

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

//: ## Shorthand Setter Declaration
//: If a computed property's setter does not define a name for the new value to be set, a default name **newValue** is used.

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//: ## Read-Only Computed Properties
//: A computed property with a getter but no setter is know as **read-only computed property**.
//: A read-only computed property always returns a value, and can be accessed througn dot syntax, but can not be set to a different vlaue.
/*:
    You must declare computed properties--inclueding read-only computed properties--as variable properties with the *var* keyword, because their value is not fixed
    The **let** keyword is only used for constant properties, to indicate that their values cannot be changed once they are set as part of instance instance initialization.
 */

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth // You can simplify the declaration of a read-only computed property by removing the get keyword and its braces
    }
}

let fourByFiveByOne = Cuboid(width: 4.0, height: 5.0, depth: 1.0)
print("the volume of fourByFiveByOne is \(fourByFiveByOne.volume)")

//: ## Property Observers

/*:
 * **willSet**
 * **didSet**
 */

//: Property observers are called every time a property's value is set, even the new value is the same as the property's current value.
/*: 
 Observe can be add to:
 * Any stored properties you define, except for lazy stored properties.
 * Any inherited properties (whether stored or computed) by overriding the property within the subclass
 */
//: You don't need to define property observers for **non-overridden computed properties**, because you can observer and respond to change their value in the computed property's setter.

//: In sum: Observer is use to oberver stored properties and super class's properties(whether store or computed) that overwrite in subclass, computed properties can be observer in their setter

/*: 
 If you implement a **willSet** observer, it's passed the new property value as a constant parameter. you can specific a name for this parameter as part of your will set implementation.(default parameter name is **newValue**, if you don't wirte it)

 **didSet** Observe is like willSet , the difference is that parameter containing the old property value and default name is oldValue
*/

/*:
 The **willSet** and **didSet** observers of superclass properties are called when a property is set in a subclass intilizer, after the superclass initializer has been called. They are not called while a class is setting its own properties, before the superclass intilizer has been called.
 */

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 500

/*: NOTE
 
 If you pass a property that has observers to a function as an in-out parameter, the willSet and didSet observers are always called. This is because of the copy-in copy-out memory model for in-out parameters: The value is always written back to the property at the end of the function. For a detailed discussion of the behavior of in-out parameters, see In-Out Parameters.
 */
 
//: ## Global and Local Variable
//: The capabilities described above for computing and ovserving properties are also available to **global variables** and local variables.
//

/*: NOTE
 Global constants and variables are always computed lazily in a similar manner to Lazy Store Properties. Unlike lazy stored properties, global constant and variables do not need to be marked with lazy modifier
 */

//: ## Type Properties
//: Instance properties are properties that belong to an instance of a particular type. Every time you create a new instance of that type, it has its own set of property values, separate from any other instance.
//: You can also define properties that belong to the type itself, not to any one instance of that type. There will only ever be one copy of these properties, no matter how many instances of that type you create. These kinds of properties are called **type properties**

/*: NOTE
 Unlike stored instance properrties, you must always give stored type properties a default value. This is because the type itself does not have an initializer that can assign a value to a sotre type property at initialization time
 Store type properties are lazily initialized on their fist access. They are guaranteed to be initialized only once, even when accessed by multiple thereads simultaneously, and they do not need to be marked with the **lazy** modifier**.
 */

//: ## Type Property Syntax

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

struct SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 27
    }
    
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

/*: static and class both associate a method with a class, rather than an instance of a class. The difference is that subclasses can override class methods; they cannot override static methods.
class properties will theoretically function in the same way (subclasses can override them)
 */



/*: NOTE
 The computed type property examples above are for read-only computed type properties, but you can also define read-write computed type properties with the same syntax as for computed instance properties.
 */

//: ## Querying and Setting Type Properties

print(SomeStructure.storedTypeProperty)

SomeStructure.storedTypeProperty = "Another value."

print(SomeStructure.storedTypeProperty)

print(SomeClass.computedTypeProperty)

print(SomeEnumeration.computedTypeProperty)


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var righChannel = AudioChannel()

leftChannel.currentLevel = 7

print(AudioChannel.maxInputLevelForAllChannels)

righChannel.currentLevel = 11

print(righChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

//: [Next](@next)
