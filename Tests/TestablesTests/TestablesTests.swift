import XCTest
import Testables
import TestablesExample

final class TestablesTests: XCTestCase {
  func testUser() {
    let user = User()
    user.testable.firstName.value = "Suyeol"
    user.testable.lastName.value = "Jeon"
    XCTAssertEqual(user.fullName, "Suyeol Jeon")
  }
}
