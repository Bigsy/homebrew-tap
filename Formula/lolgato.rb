class Lolgato < Formula
  desc "Control Elgato lights from the menu bar"
  homepage "https://github.com/Bigsy/Lolgato"
  url "https://github.com/Bigsy/Lolgato/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "b18ba26bf6dd0085331cd21f1e408cccf34664a02677cb898789dc75ad2dbc97"
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
