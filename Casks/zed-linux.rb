# frozen_string_literal: true

cask "zed-linux" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.20.2"
  sha256 arm64_linux:  "715a5252234522bc9e8e4a8c1f9b462cf7bb2881eed23b7c8ae650b41c24aa6f",
         x86_64_linux: "647dc85e09fcd99cd175365a89b7b70ccf96469c4844eb8ae6eb83dfa82f7600"

  url "https://github.com/zed-industries/zed/releases/download/v#{version}/zed-linux-#{arch}.tar.gz"
  name "Zed"
  desc "Multiplayer code editor"
  homepage "https://zed.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :linux

  binary "zed.app/bin/zed"
  artifact "zed.app/share/applications/dev.zed.Zed.desktop",
           target: "#{Dir.home}/.local/share/applications/dev.zed.Zed.desktop"
  artifact "zed.app/share/icons/hicolor/512x512/apps/zed.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/512x512/apps/zed.png"
  artifact "zed.app/share/icons/hicolor/1024x1024/apps/zed.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/1024x1024/apps/zed.png"

  zap trash: "~/.config/zed"
end
