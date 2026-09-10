# frozen_string_literal: true

cask "zed-linux" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.19.2"
  sha256 arm64_linux:  "6a7b9dac4c17b3901fda30d07e35f85f7eeb06bb96e1a348ff012aa2abed8af9",
         x86_64_linux: "c5acff2e52ac3c64890cce85250734cf7279c1de56d5926e4f4e1d4cf676359c"

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
