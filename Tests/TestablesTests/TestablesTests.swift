import XCTest
import Testables
import TestablesExample

final class TestablesTests: XCTestCase {
  func testUser() {
    let user = User()
    user.testable[.firstName] = "Suyeol"
    user.testable[.lastName] = "Jeon"
    XCTAssertEqual(user.fullName, "Suyeol Jeon")
  }
}
