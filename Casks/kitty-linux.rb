# frozen_string_literal: true

cask "kitty-linux" do
  arch arm: "arm64", intel: "x86_64"

  version "0.49.0"
  sha256 arm64_linux:  "e7a0b9187f160d88a6dd9d836e523a24d7d35502e0afb46645c757c9974d26b7",
         x86_64_linux: "ed2c015dcdea52bad5cb70461944e487af6c3f79eff4a6542717fcd315feaec2"

  url "https://github.com/kovidgoyal/kitty/releases/download/v#{version}/kitty-#{version}-#{arch}.txz"
  name "kitty"
  desc "GPU-based terminal emulator"
  homepage "https://github.com/kovidgoyal/kitty"

  depends_on :linux

  binary "bin/kitty"
  binary "bin/kitten"
  artifact "share/applications/kitty.desktop",
           target: "#{Dir.home}/.local/share/applications/kitty.desktop"
  artifact "share/applications/kitty-open.desktop",
           target: "#{Dir.home}/.local/share/applications/kitty-open.desktop"
  artifact "share/icons/hicolor/256x256/apps/kitty.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/256x256/apps/kitty.png"
  artifact "share/icons/hicolor/scalable/apps/kitty.svg",
           target: "#{Dir.home}/.local/share/icons/hicolor/scalable/apps/kitty.svg"

  zap trash: "~/.config/kitty"
end
