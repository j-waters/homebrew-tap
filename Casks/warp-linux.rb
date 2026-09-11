# frozen_string_literal: true

cask "warp-linux" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.09.08.26.stable_02"
  sha256 arm64_linux:  "c162e590972d511d3215ee4d7239137534f3a69a0fd440a2a77d7ce7f4f48021",
         x86_64_linux: "67e4b2d9b888d44cdd6f603dc6b29845f519c6daefaa4fdbaeb38d872bcf39f7"

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
