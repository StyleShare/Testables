import Testables

public class User: TestableExtension {
  fileprivate var firstName: String
  fileprivate var lastName: String

  public init() {
    self.firstName = ""
    self.lastName = ""
  }

  public var fullName: String {
    return "\(self.firstName) \(self.lastName)"
  }
}

public extension Testables where Base: User {
#if swift(>=5.1)
  var firstName: Testable<String> { &base.firstName + 0 }
  var lastName: Testable<String> { &base.lastName + 0 }
#else
  var firstName: Testable<String> { return &base.firstName + 0 }
  var lastName: Testable<String> { return &base.lastName + 0 }
#endif
}
