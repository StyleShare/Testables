public typealias Testables = PartialKeyPath

public extension Testables {
  typealias Base = Root
}

public extension Testables {
#if swift(>=5.1)
  typealias ReadOnly<Value> = KeyPath<Root, Value>
  typealias ReadWrite<Value> = WritableKeyPath<Root, Value>
#else
  typealias ReadOnly = KeyPath
  typealias ReadWrite = WritableKeyPath
#endif
}
