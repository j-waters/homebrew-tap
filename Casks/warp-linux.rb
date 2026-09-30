# frozen_string_literal: true

cask "warp-linux" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.23.14.34.stable_01"
  sha256 arm64_linux:  "ab58f6ae16a3858441cf7612f91201dcfe3be610a2d67f3f17b7ec99bd9fabcf",
         x86_64_linux: "453be210b14e7dc772ecafb4c261f3b842c86e21875b61c5d862cea1eda91e47"

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
  depends_on :linux

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
