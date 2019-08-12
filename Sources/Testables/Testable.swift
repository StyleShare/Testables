public typealias Testable<Value> = UnsafeMutablePointer<Value>

public extension Testable {
  typealias Value = Pointee
  var value: Pointee {
    get { return self.pointee }
    nonmutating set { self.pointee = newValue }
  }
}
