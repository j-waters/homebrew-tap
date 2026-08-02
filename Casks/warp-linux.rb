cask "warp-linux" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.29.09.05.stable_02"
  sha256 arm64_linux:  "f1ad7775a5d91eb80f090333d29b0497b4e3098be4c0157bae2d32f45826ab34",
         x86_64_linux: "ca38148d7dfc3de082cfb19b6e85293882eed55bce69d4d93f207d52000abb33"

  url "https://releases.warp.dev/stable/v#{version}/warp-terminal-v#{version}-1-#{arch}.pkg.tar.zst"
  name "Warp"
  desc "Rust-based terminal"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("stable", "version")&.delete_prefix("v")
    end
  end

  auto_updates true

  binary "opt/warpdotdev/warp-terminal/warp", target: "warp-terminal"
  artifact "usr/share/applications/dev.warp.Warp.desktop",
           target: "#{Dir.home}/.local/share/applications/dev.warp.Warp.desktop"
  artifact "usr/share/icons/hicolor/16x16/apps/dev.warp.Warp.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/16x16/apps/dev.warp.Warp.png"
  artifact "usr/share/icons/hicolor/32x32/apps/dev.warp.Warp.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/32x32/apps/dev.warp.Warp.png"
  artifact "usr/share/icons/hicolor/64x64/apps/dev.warp.Warp.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/64x64/apps/dev.warp.Warp.png"
  artifact "usr/share/icons/hicolor/128x128/apps/dev.warp.Warp.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/128x128/apps/dev.warp.Warp.png"
  artifact "usr/share/icons/hicolor/256x256/apps/dev.warp.Warp.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/256x256/apps/dev.warp.Warp.png"
  artifact "usr/share/icons/hicolor/512x512/apps/dev.warp.Warp.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/512x512/apps/dev.warp.Warp.png"

  zap trash: [
    "~/.cache/warp-terminal",
    "~/.local/state/warp-terminal",
    "~/.warp",
  ]
end
