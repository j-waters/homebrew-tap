# frozen_string_literal: true

cask "zed-linux" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.22.0"
  sha256 arm64_linux:  "8b3c5d6e506056a9456ed33072081fd64db84ce47cdf34d4936442cc4f08394a",
         x86_64_linux: "5ce3991b34a8fad0a23625f5821cda601c7150a6cc69683c097b8d1b083abc50"

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
