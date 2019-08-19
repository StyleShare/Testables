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
    let usernameLabel = self.viewController.testables[\.usernameLabel]
    XCTAssertEqual(usernameLabel.text, "devxoul")
  }

  func testFollowButton_isSelected() {
    // when
    self.viewController.testables[\.isFollowing] = true

    // then
    let followButton = self.viewController.testables[\.followButton]
    XCTAssertTrue(followButton.isSelected)
    XCTAssertTrue(self.viewController.testables[\.isFollowing])
  }
}
