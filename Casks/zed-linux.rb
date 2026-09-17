# frozen_string_literal: true

cask "zed-linux" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.20.1"
  sha256 arm64_linux:  "7081248afe9bfd4882482e685f1ffd1bdae7596072d52c959fbee6d976aaf0ba",
         x86_64_linux: "a273674d829d7a536bfc2566967df9eb83718f191242b26d3ebe3a46f36f4de2"

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
