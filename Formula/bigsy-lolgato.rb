class BigsyLolgato < Formula
  desc "Control Elgato lights from the menu bar"
  homepage "https://github.com/Bigsy/Lolgato"
  url "https://github.com/Bigsy/Lolgato/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "a1df20eb6fefbfc0152aa66d9994f6f59e1b57a6e6383244570011f20998f07d"
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
