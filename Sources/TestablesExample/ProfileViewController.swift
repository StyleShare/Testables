import Testables

class ProfileViewController {

  // MARK: Username

  private let usernameLabel = Label()
  var username: String? {
    get { return self.usernameLabel.text }
    set { self.usernameLabel.text = newValue }
  }


  // MARK: Following

  private let followButton = Button()
  private var isFollowing: Bool = false {
    didSet { self.followButton.isSelected = self.isFollowing }
  }
}

extension ProfileViewController: Testable {
  class TestableKeys: TestableKey<Self> {
    let usernameLabel = \Self.usernameLabel
    let followButton = \Self.followButton
    let isFollowing = \Self.isFollowing
  }
}
