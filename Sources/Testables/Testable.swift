public protocol Testable {
  typealias `Self` = Self
  associatedtype TestableKeys: TestableProtocol where TestableKeys.Base == Self
}

public extension Testable {
  var testable: TestableKeys {
    return TestableKeys.init(base: self)
  }
}
