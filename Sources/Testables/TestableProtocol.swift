public protocol TestableProtocol {
  associatedtype Base

  var base: Base { get }

  init(base: Base)
}

public extension TestableProtocol {
  subscript<Value>(_ keyPath: KeyPath<Self, KeyPath<Base, Value>>) -> Value {
    let baseKeyPath = self[keyPath: keyPath]
    return self.base[keyPath: baseKeyPath]
  }

  subscript<Value>(_ keyPath: KeyPath<Self, ReferenceWritableKeyPath<Base, Value>>) -> Value {
    get {
      let baseKeyPath = self[keyPath: keyPath]
      return self.base[keyPath: baseKeyPath]
    }
    nonmutating set {
      let baseKeyPath = self[keyPath: keyPath]
      self.base[keyPath: baseKeyPath] = newValue
    }
  }
}
