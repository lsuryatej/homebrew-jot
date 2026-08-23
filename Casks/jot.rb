cask "jot" do
  version "1.2.0"
  sha256 "3f1e4935bc5ddd0b9fca664fcf2844645d4cfa52ca0c41cc1936fde85a58b7b6"

  url "https://github.com/lsuryatej/jot/releases/download/v#{version}/Jot-#{version}.zip"
  name "Jot"
  desc "Fast, native, plain-text scratchpad for macOS"
  homepage "https://github.com/lsuryatej/jot"

  depends_on macos: :sonoma

  app "Jot.app"

  # Jot is ad-hoc signed, not notarized — there is no paid Apple Developer
  # account behind this project. Homebrew's own download-and-stage process
  # applies the quarantine attribute to the archive the same way a browser
  # download would, which is what triggers Gatekeeper's "Not Opened" dialog
  # on first launch. install.sh (the non-Homebrew install path) strips this
  # itself, but that script never runs for a `brew install` — this postflight
  # is the equivalent for the Homebrew path, so quarantine never has a chance
  # to block the first launch here either.
  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/Jot.app"]
  end

  zap trash: [
    "~/Library/Application Support/Jot",
    "~/Library/Preferences/com.suryatejlalam.Jot.plist",
  ]
end
