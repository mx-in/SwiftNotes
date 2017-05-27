//: [Previous](@previous)


//: Initializing an Empty String

var emptyStirng = ""

var anotherEmptyString = String()

if emptyStirng.isEmpty {
    print("Noting to see here")
}

//: String Mutability

var variableString: String = "Horse"
variableString += "and carriage"

//: constant string can't be modified

//: ## String Are Value Type(Struct)

//: ## Character
for character in "Dog!yuan🐶".characters {
    print(character)
}

//: Create a stand-along Character
let exclamationMark: Character = "!"

//: String value can be constructed by passing an array of Character values as an argument to its initializer
let dogCharacters: [Character] = ["D", "o", "g", "!", "🐶"]
let dogString = String(dogCharacters)


//: Connectenating Strings and Characters
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)

//: String Interpolation
let multiplier = 3
let message = "\(multiplier) time 2.5 is \(Double(multiplier))"


//: ## Unicode

//: Unicode Scalars
//: \u{n} n is 1-8 digit hexadecimal number with a value equal to a valid Unicode code point

let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

//: Extended Grapheme Clusters
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let enclosedEAcute: Character = "\u{E9}\u{20D0}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"


//: ## Accessing and Modifying a String

//: String Indices

let greeting = "Guten Tag!"
greeting[greeting.startIndex]

greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.characters.indices {
    print("\(greeting[index])", separator: "", terminator: "")
}
print("")

//: insert And removing

welcome.insert("!", at: welcome.endIndex)

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)


for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator:"")
}
print("")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}

print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}


//: [Next](@next)
