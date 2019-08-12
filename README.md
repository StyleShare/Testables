# Testables

Make private properties testable. Be aware of using this project since it is very conceptual.

## Background

Let's assume that there is a class named `ProfileViewController`. This class has a property `username` which sets `usernameLabel.text` when the new value is assigned. Unfortunately, we cannot write an unit test because `usernameLabel` is a private property.

**ProfileViewController.swift**

```swift
class ProfileViewController {
  var username: String? {
    didSet {
      self.usernameLabel.text = self.username
    }
  }
  private let usernameLabel = UILabel()
}
```

**ProfileViewControllerTests.swift**

```swift
// when
viewController.username = "devxoul"

// then
let usernameLabel = viewController.usernameLabel // 🚫 private
XCTAssertEqual(usernameLabel.text, "devxoul")
```

## Solution

Testables provides a generic way to expose private properties using Swift KeyPath.

Add the lines below to ProfileViewController.swift:

```swift
extension ProfileViewController: Testable {
  final class TestableKeys: TestableKey<Self> {
    let usernameLabel = \Self.usernameLabel
  }
}
```

And update the test code:

```swift
// when
viewController.username = "devxoul"

// then
let usernameLabel = viewController.testable[\.usernameLabel] // ✅
XCTAssertEqual(usernameLabel.text, "devxoul")
```

## License

Testables is under MIT license. See the [LICENSE](LICENSE) file for more info.
