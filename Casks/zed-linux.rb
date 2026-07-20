cask "zed-linux" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.11.3"
  sha256 arm64_linux:  "deba67d5fcc042b8ad9f92e803464b4ea0b220880fdc373ba5827fcad4ebd9fc",
         x86_64_linux: "483ee09c885801dd7a0230e3ccf5c463c4dbe4559927f5856fd568e7b1a32e3e"

  url "https://github.com/zed-industries/zed/releases/download/v#{version}/zed-linux-#{arch}.tar.gz",
      verified: "github.com/zed-industries/zed/"
  name "Zed"
  desc "Multiplayer code editor"
  homepage "https://zed.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "zed.app/bin/zed"
  artifact "zed.app/share/applications/dev.zed.Zed.desktop",
           target: "#{Dir.home}/.local/share/applications/dev.zed.Zed.desktop"
  artifact "zed.app/share/icons/hicolor/512x512/apps/zed.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/512x512/apps/zed.png"
  artifact "zed.app/share/icons/hicolor/1024x1024/apps/zed.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/1024x1024/apps/zed.png"

  zap trash: "~/.config/zed"
end
