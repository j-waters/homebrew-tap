# frozen_string_literal: true

cask "kitty-linux" do
  arch arm: "arm64", intel: "x86_64"

  version "0.49.1"
  sha256 arm64_linux:  "828fcfe3e165c84d830f82545b6d568655b2620d77b7d5a4360e082bd9ba744b",
         x86_64_linux: "8cfd68ed484d9a32e4e389abffe1a0ec6e0fbd7be5c9ea1c4fa41b9ead4af791"

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
