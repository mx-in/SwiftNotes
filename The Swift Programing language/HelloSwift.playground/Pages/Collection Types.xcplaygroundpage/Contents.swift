//: [Previous](@previous)

//: # Collection Types

//: ## Array

//: Creating an Empty Array
var someInts = [Int]()

someInts.append(3)
someInts  = []

//: ## Creating an Array with a Default Value

var threeDoubles = Array(repeating: 1.1, count: 3)

//: ## Creating an Array by Adding Two Array Together
//: the new array's type is inferred from the type of the two arrays you add together

var anotherDoubles = Array(repeating: 0.0, count: 5)

var sixDoubles = threeDoubles + anotherDoubles

//: Creating an Array with an Array Literal
var shoppingList: [String] = ["Eggs", "Milk"]
//: "[String]" can be removed, Swift can inferr it

//: Accessing and Modifying an Array use subscript syntax.
//: **count** readonly property of number of items in an array.

print("The shopping list contains \(shoppingList.count) items")
//: Use isEmpty as a short for checking whether the count property is equalt to 0

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

//: append(_:)
shoppingList.append("Flour")

//: +=
shoppingList += ["Baking Powder"]

//: Use subscirpt syntax
var firstItem = shoppingList[0]

//: Use subscript syntax to change an existing value at a given index
shoppingList[0] = "Eight eggs"

//: Use sbuscript syntax to change a range of values at once
shoppingList[1..<3] = ["Bananas", "Apples"]
print(shoppingList)

//: insert(_at:)
shoppingList.insert("Maple Syrup", at: 0)

//: remove(_at:) return removed item
let mapleSyrup = shoppingList.remove(at: 0)

//: removeLast()
let apple = shoppingList.removeLast()

//: ## Iterating Over an Array
for item in shoppingList {
    print(item)
}

//: Use the enumerater() if need the integer index of each item
//: enmuerated() method returns a tuple composed of an integer and the item

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}


//: # Sets
//: A set stores distinct values of the same type in a collection with no defined ordering.

//: ## Hash Values of Set Types
//: A hash value(Int) that is the same for all objects that comapre equally.
//: Such as a == b, it follows that a.hashValue == b.hashValue
//: All of Swift's basic types (such as String, Int, Double, and Bool) are hashable by default, and can be used as set value types or dictionary key types. Enumeration case values without associated values are also hashable by default.
/*:
 “You can use your own custom types as set value types or dictionary key types by making them conform to the Hashable protocol from Swift’s standard library. Types that conform to the Hashable protocol must provide a gettable Int property called hashValue. The value returned by a type’s hashValue property is not required to be the same across different executions of the same program, or in different programs.
 Because the Hashable protocol conforms to Equatable, conforming types must also provide an implementation of the equals operator (==). The Equatable protocol requires any conforming implementation of == to be an equivalence relation. That is, an implementation of == must satisfy the following three conditions, for all values a, b, and c:
* a == a (Reflexivity)
* a == b implies b == a (Symmetry)
* a == b && b == c implies a == c (Transitivity)
 For more information about conforming to protocols, see Protocols.”
 
 */

//: Set

var letters = Set<Character>()
print("letters is of type set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []

//: Creating a Set with an Array Literal.
//: A set type cannot be inferred from an array literal alone, so the type **Set** must be explicitly declared.
var favoriteGeners: Set<String> = ["Rock", "Clissical", "Hip Hop"]

//: don't have to write the type of the set if you're initializing ite with an array literal containing values of the same type.
var favoriteFood: Set = ["hanburge", "sala", "chip"]

//: Accessing an Modifying a Set
print("I have \(favoriteGeners.count) favorite music genres")

if favoriteGeners.isEmpty {
    print("As far as music goes, I'm not picky")
} else {
    print("I have particular music preference.")
}

//: insert(_:) return nil if the set did not contain it.

//: removeAll()

if let removedGenre = favoriteGeners.remove("Hip Hop") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that")
}

// contains(_:)

//: ## Iterating Over a Set
for genre in favoriteGeners {
    print("\(genre)")
}

//: Swift's Set type does not have a defined ordereing To iterate over the values of a set in a specific order

//: **sorted()** method return the set's elements as an array sorted using the < operator

for genre in favoriteGeners.sorted() {
    print("\(genre)")
}

//: Performing Set Operations
//: Fundamental Set Operations

/*: 
 * intersection(_:)
 * symmetricDifference(_:) // create a new set with either set, but not both
 * union(_:)
 * subtracting(_:)
 */

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

/*: 
 * == determine wheather two sets contain all of the same values
 * isSubSet(of:)
 * isSuperSet(of:)
 * isStrictSubSet(of:) isStirctSuperset(of:)
 * isDisjoint(with:)
 */

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

houseAnimals.isStrictSubset(of: farmAnimals)

//: ## Dictionaries

/*:
 * Unlike items in an array, items in dictionary do not have specific order.
 * A dictionary **key** type must conform to the Hashable protocol
 */

//: Dictionary Type Shorthand Syntax
//: Dictionary<Key, Value>
//: [Key: Value]

//: ## Creating an Empty Dictionary

var nameOfIntegers = [Int: String]()

nameOfIntegers[16] = "sixteen"
nameOfIntegers = [:]

//: Creating a Dictionary with a Dictionary Literal
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Diblin"]

var weekDay = ["first": "Monday", "second": "SatDay"]

//: Accessing and Modifying a Dictionary
print("The airports dictionary contains \(airports.count) items")

//: isEmpty

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

//: As an alternavite to subscripting use a dictionary's updateValue(_:forKey:) 
//: this method return old value after performing an update. This enables to check whether or not an update took place.
airports.updateValue("London Heathrow", forKey: "LHR")

var lhr = airports["LH"]

if let airportName = airports["DUB"] {
    print("The name of airport is \(airportName)")
}

//: remove a key-value pair from a dictionary by assigning a value of nil
airports["APL"] = "Apple so fool"
airports["APL"] = nil

//: Alternatively remove with removeValue(forKey:); if it exist returns the removed value, or returns nil if no value existed

//: Iterating Over a Dictionary
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport Name \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

//: Swift's Dictionary type does not have a define ordering. To iterate over the key or values of a dictionary in s specific order, use the sorted() method on it's keys or values property

//: [Next](@next)
