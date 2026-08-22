cask "jot" do
  version "1.1.0"
  sha256 "b86765838cf00e2a6df226e4e2763d1b82375ab98c636791c1359e1a089a034d"

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
