public protocol TestableExtension {
  associatedtype Base

  static var testable: Testables<Base>.Type { get }
  var testable: Testables<Base> { get }
}

public extension TestableExtension {
  static var testable: Testables<Self>.Type {
    return Testables.self
  }

  var testable: Testables<Self> {
    return Testables(base: self)
  }
}
