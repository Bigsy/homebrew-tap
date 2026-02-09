class BigsyLolgato < Formula
  desc "Control Elgato lights from the menu bar"
  homepage "https://github.com/Bigsy/Lolgato"
  url "https://github.com/Bigsy/Lolgato/archive/refs/tags/v1.9.3.tar.gz"
  sha256 "7c4405d9d2ee079b30c6d7e86138109196185febe8ca640c22d20bd18ed8b7dc"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    ENV["SWIFTPM_DISABLE_SANDBOX"] = "1"

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
