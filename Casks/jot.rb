cask "jot" do
  version "1.4.0"
  sha256 "9c89d9c8ec41ebf3e611a37f63a23225f3bbc1d9ca4b0b188d2d781ba3c3f576"

  url "https://github.com/lsuryatej/jot/releases/download/v#{version}/Jot-#{version}.zip"
  name "Jot"
  desc "Fast, native, plain-text scratchpad"
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
  #
  # This is the declarative `postflight_steps` form rather than the older
  # `postflight do ... end` block, which Homebrew now warns about on every
  # install. Steps run inside a sandbox, so `{{appdir}}` is expanded by the
  # runner instead of by Ruby string interpolation, and the app bundle has to
  # be named as writable for xattr to be allowed to touch it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-cr", "{{appdir}}/Jot.app"],
        writable_paths: ["{{appdir}}/Jot.app"]
  end

  zap trash: [
    "~/Library/Application Support/Jot",
    "~/Library/Preferences/com.suryatejlalam.Jot.plist",
  ]
end
