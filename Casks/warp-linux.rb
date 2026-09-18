# frozen_string_literal: true

cask "warp-linux" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.16.08.27.stable_02"
  sha256 arm64_linux:  "9827a1c1c7c9974b1750a672fc3f7029b9011cfb75b3f9f270a0891a504d2e08",
         x86_64_linux: "43aeee572d447e60b03c8ccb111e4a7d654bf1734ac8d8ab37930c7deabdd0d4"

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
