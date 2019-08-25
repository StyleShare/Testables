public protocol Testable {
  typealias `Self` = Self
  associatedtype TestableKeys: TestableProtocol where TestableKeys.Base == Self
}

public extension Testable {
  var testables: TestableKeys {
    return TestableKeys.init(base: self)
  }
}
