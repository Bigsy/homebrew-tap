cask "bigsy-lolgato" do
  version "1.9.4"
  sha256 "d630211ca2502eb36ffa15da5dcbbe133328b8c73dbd3ea83656bdaf120e41d8"

  url "https://github.com/Bigsy/Lolgato/releases/download/v1.9.4/Lolgato.zip"
  name "Lolgato"
  desc "Control Elgato lights from the menu bar"
  homepage "https://github.com/Bigsy/Lolgato"

  depends_on macos: ">= :sonoma"

  app "Lolgato.app"
end
