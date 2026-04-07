cask "bigsy-macsyzones" do
  version "0.0.2"
  sha256 "51a055af9d4d89a0b6a5b7baa1fe803a58657d42693f205efb6c1aa73e67855b"

  url "https://github.com/Bigsy/MacsyZones/releases/download/v0.0.2/MacsyZones.zip"
  name "MacsyZones"
  desc "macOS window management with zone snapping"
  homepage "https://github.com/Bigsy/MacsyZones"

  depends_on macos: ">= :big_sur"

  app "MacsyZones.app"
end
