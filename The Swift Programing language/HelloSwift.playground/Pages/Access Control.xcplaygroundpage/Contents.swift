//: [Previous](@previous)

//: # Access Control


//: ## Modules and Source Files

/*:
 * **Concept of Module**:
    Each build target(such as an app bundle or framework) in Xcode is treated as a separate module in Swift. It can be imported by another module with Swift's **import** keyword.
    **Source file**: A single Swift source code file within a module
 */

//: ## Access Levels
//: Swift provides five different **access level** for entities within you code, it's relative to the source file in which an entity is defined, and the module that source file belongs to

/*:
 ### Access
 * **Open&public**: enable entities be used within any source file from their defining module, and also in a source file from another module that imports the defining module.
 * **Internal**: enables entities to be used within any source file from their defining module, but not in any source file outside of that module.
 * **File-private**: restricts the use of an entity to its own defining source file.
 * **Private**: restricts the use of an entity to enclosing declaration.
 
 Open access is the hightest and private is lowest
 
 ### Different between Open & public
 Open access applies only to classes and class member
 * Classes with **public** access, or any more restrictive access level, can be subclassed only within the module where they’re defined.
 
 * Classes member with **public** access, or any more restrictive access level, can be overidden by subclass only within the module where they're defined.
 
 * Open classes can be subclassed within the module where they’re defined, and within any module that imports the module where they’re defined.
 
 * Open class members can be overridden by subclasses within the module where they’re defined, and within any module that imports the module where they’re defined.
 
 In Sum up
 -------------------------------------------------------------------------
|        | be subclassed                  | be overidden                  |
 -------------------------------------------------------------------------
| pubilc | within module defined          | within module defined         |
 -------------------------------------------------------------------------
| open   | within module defined/imported | ithin module defined/imported |
 -------------------------------------------------------------------------
 
 */


//: ## Guiding Principle of Access Levels:
//: **No entity can be defined in terms of an other entity that has a lower(more restrictive) access level**
/*:
 ### For example
 * A public variable cannot be defined as have an internal, file-private, or private type, because the type might not be available everywhere that the public variable is used.
 * A function cannot have a higher access level than its parameter types and return type, because the function could be used in situations where its constituent types are not available to the surrounding code.
 */

//: ## Default Access Levels
//: ### All entities in your code have a default access level of internal if your code do not specify an explict access level yourself.

//: ## Access Levels for Single-Target Apps
//: default internal may use file private , private is enough.

//: ## Access Levels for FrameWorks
//: mark an entity as open or public only if you want it to become part of your framework's API

//: ## Access Level for Unit Test Targets
//: A unit test target can access any internal entity; you need to mark the import declaration for a product module with the @testable

//: ## Access Control Syntax

// open, public, internal, file-private, private

public class somePublicClass
        {}

internal class someInternalClass
        {}

fileprivate class someFileprivateClass
        {}

private class somePrivateClass
        {}

public var somePublicVariable = 0

internal let comeInternalConstant = 0

fileprivate func someFilePrivateFunction () {}

private func somePrivateFunction () {}


//: ## Custom Types

/*:
 The access control level of a type also affects the default access level of that type’s members (its properties, methods, initializers, and subscripts). If you define a type’s access level as private or file private, the default access level of its members will also be private or file private. **If you define a type’s access level as internal or public (or use the default access level of internal without specifying an access level explicitly), the default access level of the type’s members will be internal**.
 
 
 */


public class SomePublicClass {
    public var somePublicProperty = 0
    
    var someInternalProperty = 0
    //implicitly internal class member
    
    fileprivate func someFilePrivateMethod() {
        
    }
    
    private func somePrivateMethod() {
        
    }
}

class someInternalClasss {
    //implicitly internal access
    
    var someInternalProperty = 0
//    implicitly internal class member
    
     func someFilePrivateMethod() {}
//    explicitly file-private class member
    
    private func somePrivateMethod() {}
}

fileprivate class someFileprivateClasss {
//    explicity file-private class
    
    func someFilePrivateMethod() {}
//    implicitly file-private class member
    
    private func somePrivateMethod () {}
    // explicity private class member
}



//: ## Tuple Types
//: **The access level of tuple type is the most restrictive access level of all types used in tuple.**
//: > “Tuple types do not have a standalone definition in the way that classes, structures, enumerations, and functions do. A tuple type’s access level is deduced automatically when the tuple type is used, and cannot be specified explicitly.”

//: ## Function Types
//: The access level for a function type is calculated as the most restrictive access level of the function’s parameter types and return type. You must specify the access level explicitly as part of the function’s definition if the function’s calculated access level does not match the contextual default.

//func someFunction() -> (someInternalClass, somePrivateClass) {
//    // imp
//}

//: the overall access level of the compound tuple type is "private", because the function's return type is private( a tuple with a private)

//: you must mark the function's overall access level withe the `private` modifier for function declaration to valid)
private func someFunction() -> (someInternalClass, somePrivateClass) {
    return (someInternalClass(), somePrivateClass())
}

//: ## Enumeration Types
//: The individual cases of an enumation automatically receive the same access level as the enumeration they belong to. You can not specify a different access level for individual enumeration cases.

public enum CompassPoint {
    case north
    case south
    case west
    case east
}

//: ### Raw Values and Associated Values
//: raw value must have an access level, at least as high as enumeration's access level.

//: ## Nested Types
//: within private automatic private.
//: within file-private automatic file-private.
//: within public internal automatic interval.

//: if you want a nested type within a public type to be publicly available, you must explicity declare the nested type as public.

//: ## SubClass
//: A subclass cannot have a highter access level than its superclass.
//: An override can make an inheride class member more accessible than its superclass version.
class A {
    fileprivate func someMethod() {}
}

class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

//: it is even valid for a subclass memeber to call a superclass member that has lower access permissions than the subclass member, because superclass A and subclass B are defined in the same source file, it is valid for the B implementation of `someMethod()` to call `super.someMethod()`.


//: ## Constants, Variables, Properties, and Subscripts
//: A constant, variable, or property cannot be more public than its type, it is not valid to write a public property with a private type.

private var privateInstance = somePrivateClass()

//: ## Getter and Setter
//: Getter and setters for constants, variables properties, and subscripts automaticall receive the same access level as the constant, vairable, property, or subscript belong to.
//: you can give a setter a **lower** level access than its corresponding getter, to restrict the read-write scope of that variable,property,or subscript. You assign a lower access level by writing fileprivate(set), private(set), or internal(set) before the var or subscript introducer.

struct TrackedString {
    private(set) var numberOfEdits = 0
    
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString();

stringToEdit.value = "This String will be tarcked."
stringToEdit.value = "This edit will increment numberOfEdits"
print("The number of edits is \(stringToEdit.numberOfEdits)")

public struct TrackString2 {
    public private(set) var numberOfEdits = 0

    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}

//: ## Initializers
//: Custom initializers can be assigned an access level less than or equal to the type that they initialize. The only exception is for required initializers. A reauired initializer must have the same access level as the class it belongs to.

//: As with funciton an method parameters, the types of an initializer's parameters cannot be more private than the initializer's own access level.

//: ## Default Initializers
//: Swift automatically provides a default initializer without any arguements for any structure or base class that provides default values for all its properties and does not provide at least one initializer itself.
//: A default initializer has the same access level as the type it initializer, unless taht type is defined as **public**, default initializer is considered internal. you must explicityly provide a public no-argument initializer by you self, if you want a public none arguements initializer.


//: ## Default Memberwise(每一成员) Initializers for Structure Types

//: private: if any struct stroied properties are private.
//: file-private: if any struct stroied file-properties are file-private
//: otherwise : internal

//: if you want a public structure type to be initializable with a memberwise initializer when used in another moudle, do it by youself

//: ## Protocols
//: The access level of each requirement within a protocol definition is automatically set to the same access as the protocol.

//: > If you define a public protocol, the protocol’s requirements require a public access level for those requirements when they are implemented. This behavior is different from other types, where a public type definition implies an access level of internal for the type’s members.

//: ## Protocol Inheritance
//: The new protocol that inherits from an exisiting protocol can have at most the same access level as the protocol it inherits from. You cannot write a public protocol that inherits from an internal protocol

//: ## Protocol Conformance(一致性)
//: A type can conform to a protocol with a lower access level than the type itself.

//: ## Extensions
//: Any type members added in an extension have the same default access level as type members declared in the original type being extended.

//: You can mark an extension with an explicit access-level modifier to set a new default access level for all members defined within the extension. This new default can still be overriden within the extension for individual type members.

//: ## Adding Protocol Conformance with an Extension
//: You cannot provide an explicit access-level modifier for an extension if you are using that extension to addd protocol conformance. Instead, the protocol's own access level is used to provide the default access level for each protocol reauirement implementation within the extension.

//: Generics
//: The access for generic type of generic function is the minimum of the access level of the generic type or function itself and the access level of any type constraints on its type parameters.


//: ## Type Alianses
//: Any type aliases you define are treated as distinct types for the purposes of access control.
//: A type alias can have an access level less than or equal to the access level of the type it aliases. For example, a private type alias can alias a private, file-private, internal, public, or open type, but a public type alias cannot alias an internal, file-private, or private type.









//: [Next](@next)
