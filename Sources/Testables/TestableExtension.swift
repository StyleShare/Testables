public protocol TestablesProtocol {
  associatedtype Base

  var base: Base { get }
  init(base: Base)
}

open class Of<Base>: TestablesProtocol {
  public let base: Base

  public required init(base: Base) {
    self.base = base
  }
}

public protocol TestableExtension {
  associatedtype Testables: TestablesProtocol where Testables.Base == Self
}

public extension TestableExtension {
  var testable: Testables {
    return Testables.init(base: self)
  }
}
