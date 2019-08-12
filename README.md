# Testables

Make private properties testable. Be aware of using this project since it is very conceptual.

## Background

Let's assume that we have a class named `User`. This class has a property `fullName` which depends on `firstName` and `lastName`. The property `fullName` cannot be easily tested because `firstName` and `lastName` are declared as private. And we don't want to make those property public.

```swift
// User.swift
class User {
  fileprivate var firstName: String
  fileprivate var lastName: String

  var fullName: String {
    return "\(self.firstName) \(self.lastName)"
  }
}

// UserTests.swift
let user = User()
user.firstName = "Suyeol" // ⚠️ private
user.lastName = "Jeon" // ⚠️ private
XCTAssertEqual(user.fullName, "Suyeol Jeon")
```

## Testables

Testables provides a generic way to expose private properties using Swift KeyPath.

Add the lines below to User.swift:

```swift
// User.swift
extension Testables where Base: User {
  static var firstName: ReadWrite<String> { \.firstName }
  static var lastName: ReadWrite<String> { \.lastName }
}
```

And update the test code with:

```swift
// UserTests.swift
let user = User()
user.testable[.firstName] = "Suyeol"
user.tesatble[.lastName] = "Jeon"
XCTAssertEqual(user.fullName, "Suyeol Jeon")
```

## Alternative Approaches

Using UnsafeMutablePointer:

```swift
typealias Testable = UnsafeMutablePointer

// User.swift
extension Testables where Base: User {
  var firstName: Testable<String> { &self.base.firstName + 0 }
  var lastName: Testable<String> { &self.base.lastName + 0 }
}

// UserTests.swift
let user = User()
user.testable.firstName.pointee = "Suyeol"
user.tesatble.lastName.pointee = "Jeon"
XCTAssertEqual(user.fullName, "Suyeol Jeon")
```

## License

Testables is under MIT license. See the [LICENSE](LICENSE) file for more info.
