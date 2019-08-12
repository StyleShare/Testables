import Foundation

public final class Testable<Base> {
  var base: Base

  init(base: Base) {
    self.base = base
  }

  public typealias ReadOnlyKeyPath<Value> = KeyPath<Base, Value>
  public typealias ReadWriteKeyPath<Value> = WritableKeyPath<Base, Value>

  public subscript<Value>(_ keyPath: ReadOnlyKeyPath<Value>) -> Value {
    return self.base[keyPath: keyPath]
  }

  public subscript<Value>(_ keyPath: ReadWriteKeyPath<Value>) -> Value {
    get {
      return self.base[keyPath: keyPath]
    }
    set {
      self.base[keyPath: keyPath] = newValue
    }
  }
}


public protocol TestableExtension {
  associatedtype Base

  static var testable: Testable<Base>.Type { get }
  var testable: Testable<Base> { get }
}

public extension TestableExtension {
  static var testable: Testable<Self>.Type {
    return Testable.self
  }

  var testable: Testable<Self> {
    return Testable(base: self)
  }
}
