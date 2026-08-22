cask "jot" do
  version "1.0.0"
  sha256 "d022d0cf843f56d450d8b459711da7b98ba94b3cb600af6ac5cd09cfc43b3dd9"

  url "https://github.com/lsuryatej/jot/releases/download/v#{version}/Jot-#{version}.zip"
  name "Jot"
  desc "Fast, native, plain-text scratchpad for macOS"
  homepage "https://github.com/lsuryatej/jot"

  depends_on macos: :sonoma

  app "Jot.app"

  zap trash: [
    "~/Library/Application Support/Jot",
    "~/Library/Preferences/com.suryatejlalam.Jot.plist",
  ]
end
