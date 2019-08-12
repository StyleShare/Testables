import XCTest
import Testables
@testable import TestablesExample

final class ProfileViewControllerTests: XCTestCase {

  var viewController: ProfileViewController!

  override func setUp() {
    self.viewController = ProfileViewController()
  }

  func testSetUsername_updatesNicknameLabelText() {
    // when
    self.viewController.username = "devxoul"

    // then
    let usernameLabel = self.viewController.testable[\.usernameLabel]
    XCTAssertEqual(usernameLabel.text, "devxoul")
  }

  func testFollowButton_isSelected() {
    // when
    self.viewController.testable[\.isFollowing] = true

    // then
    let followButton = self.viewController.testable[\.followButton]
    XCTAssertTrue(followButton.isSelected)
    XCTAssertTrue(self.viewController.testable[\.isFollowing])
  }
}
