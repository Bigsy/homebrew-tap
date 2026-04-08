cask "bigsy-macsyzones" do
  version "0.0.3"
  sha256 "05a9f6be0374c37b73f87661327f6ffa0fef57668143e6a65b4f95171b1327f7"

  url "https://github.com/Bigsy/MacsyZones/releases/download/v0.0.3/MacsyZones.zip"
  name "MacsyZones"
  desc "macOS window management with zone snapping"
  homepage "https://github.com/Bigsy/MacsyZones"

  depends_on macos: ">= :big_sur"

  app "MacsyZones.app"
end
