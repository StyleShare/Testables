open class TestableKey<Base>: TestableProtocol {
  public let base: Base

  required public init(base: Base) {
    self.base = base
  }
}
