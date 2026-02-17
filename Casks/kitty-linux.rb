cask "kitty-linux" do
  arch arm: "arm64", intel: "x86_64"

  version "0.45.0"
  sha256 arm64_linux:  "934489d4c70177a2c32b6b2581008b398d68f2cf28e89b77f172d359a9679ed6",
         x86_64_linux: "e6b70867a9a35181796775c79ebfbd82e00cf18c38b2bbdad73ff48d362380da"

  url "https://github.com/kovidgoyal/kitty/releases/download/v#{version}/kitty-#{version}-#{arch}.txz"
  name "kitty"
  desc "GPU-based terminal emulator"
  homepage "https://github.com/kovidgoyal/kitty"

  binary "bin/kitty"
  binary "bin/kitten"
  artifact "share/applications/kitty.desktop",
           target: "#{Dir.home}/.local/share/applications/kitty.desktop"
  artifact "share/applications/kitty-open.desktop",
           target: "#{Dir.home}/.local/share/applications/kitty-open.desktop"
  artifact "share/icons/hicolor/256x256/apps/kitty.png",
           target: "#{Dir.home}/.local/share/icons/hicolor/256x256/apps/kitty.png"
  artifact "share/icons/hicolor/scalable/apps/kitty.svg",
           target: "#{Dir.home}/.local/share/icons/hicolor/scalable/apps/kitty.svg"

  zap trash: "~/.config/kitty"
end
