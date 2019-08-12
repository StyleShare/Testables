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
  static var firstName: ReadWrite<String> { \.firstName }
  static var lastName: ReadWrite<String> { \.lastName }
#else
  static var firstName: ReadWrite<User, String> { return \.firstName }
  static var lastName: ReadWrite<User, String> { return \.lastName }
#endif
}
