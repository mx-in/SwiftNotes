//: [Previous](@previous)

//: # Properties

//: properties associate values with a particular class, structure, or enumeration.

//: Stored properties
//: store constant an vairable values as part of instance; provide only by classes and structures


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
//: This behaviour is due to structures being **value types**. When an isntance of a value type is marked as a constant, so are all of its properties

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







//: [Next](@next)
