class BigsyLolgato < Formula
  desc "Control Elgato lights from the menu bar"
  homepage "https://github.com/Bigsy/Lolgato"
  url "https://github.com/Bigsy/Lolgato/archive/refs/tags/v1.9.2.tar.gz"
  sha256 "782a6ec7c6e90125b22a6876f493f18ddc1228e7d8fef47889b03dff5be1296b"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "xcodebuild",
      "-project", "Lolgato.xcodeproj",
      "-scheme", "Lolgato",
      "-configuration", "Release",
      "-derivedDataPath", buildpath/"build",
      "CODE_SIGN_IDENTITY=-",
      "CODE_SIGNING_REQUIRED=NO",
      "CODE_SIGNING_ALLOWED=NO",
      "-quiet"
    prefix.install Dir[buildpath/"build/Build/Products/Release/Lolgato.app"]
  end
end
