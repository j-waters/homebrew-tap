# frozen_string_literal: true

cask "kitty-linux" do
  arch arm: "arm64", intel: "x86_64"

  version "0.49.2"
  sha256 arm64_linux:  "0c81a995614426cccf0fecaf7d104d47cd63bbccf173d14976e9f92e3d60fce6",
         x86_64_linux: "d573618b911e9c461bd421b96c13c74c7f1cb2f1ac9c327818d4ff84366cf5c6"

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
