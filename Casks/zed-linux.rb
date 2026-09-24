# frozen_string_literal: true

cask "zed-linux" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.21.0"
  sha256 arm64_linux:  "69eff51b22203be7a4d0fd9df0864a8abd4d5183e8fb9aafa2af57f3cd42b9a3",
         x86_64_linux: "b79a992e960ed4067cb2b50d66789ed8618eeb1780ed6a0f8f1e71dd80f74200"

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
