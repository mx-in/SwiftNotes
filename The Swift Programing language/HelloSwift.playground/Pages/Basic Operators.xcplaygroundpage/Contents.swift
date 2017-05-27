//: [Previous](@previous)


//: Overflow Operator
let upperOverflowInt = Int.max &+ 1
let minOverflowInt = Int.min &- 1

//: === and !== 
//: use to test weather or tow object references both refer to the same object instance.

//: Compare tuples
// compare from left to right, one value at a time, untile the comparison finds two values that aren't equal; if all the elements are equal, the the tuples themselvef are equal.

(1, "hello") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")

"anae" < "anb"

//: Ternary Conditional Operator

let contentHeight = 40
let hasHeader = true

let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//: Nil-Coalescing Operator

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

//: Closed Range Operator

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//: Half-Open Range Operator
//: The half-open range operator (a..<b) defines a range that runs from a to b, but does not include b.
let names = ["Anna", "Jack", "Bernadat"]
let count = names.count

for i in 0..<count {
    print("Person \(i) is called \(names[i])")
}











//: [Next](@next)
