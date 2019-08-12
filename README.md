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

Testables provides a generic way to expose private properties using UnsafeMutablePointer.

Add the lines below to User.swift:

```swift
// User.swift
extension Testables where Base: User {
  static var firstName: Testable<String> { &base.firstName + 0 }
  static var lastName: Testable<String> { &base.lastName + 0 }
}
```

And update the test code with:

```swift
// UserTests.swift
let user = User()
user.testable.firstName.value = "Suyeol"
user.tesatble.lastName.value = "Jeon"
XCTAssertEqual(user.fullName, "Suyeol Jeon")
```

## License

Testables is under MIT license. See the [LICENSE](LICENSE) file for more info.
