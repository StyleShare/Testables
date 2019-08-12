import Testables

public class User: TestableExtension {
  private var firstName: String
  private var lastName: String

  public init() {
    self.firstName = ""
    self.lastName = ""
  }

  public var fullName: String {
    return "\(self.firstName) \(self.lastName)"
  }
}

public extension User {
  final class Testables: Of<User> {
    public lazy var firstName = Testable(&base.firstName)
    public lazy var lastName = Testable(&base.lastName)
  }
}
