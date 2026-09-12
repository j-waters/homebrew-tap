# frozen_string_literal: true

cask "kitty-linux" do
  arch arm: "arm64", intel: "x86_64"

  version "0.48.2"
  sha256 arm64_linux:  "534b214d407a05e4603da75ef02fffa592ec1bbec20a413c5e0cd3f853c928cb",
         x86_64_linux: "967a1958e7fc67b495d279c0963bcd1a0482097151817ce6506fabc822689af7"

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
