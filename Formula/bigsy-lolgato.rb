class BigsyLolgato < Formula
  desc "Control Elgato lights from the menu bar"
  homepage "https://github.com/Bigsy/Lolgato"
  url "https://github.com/Bigsy/Lolgato/archive/refs/tags/v1.9.1.tar.gz"
  sha256 "29e57bcbcae7d3b41ad5211f8abee07ad25d62d5b0b8e2ef6cb3ad48f81d3b19"
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
