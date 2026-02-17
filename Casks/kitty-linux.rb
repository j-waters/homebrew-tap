cask "kitty-linux" do
  arch arm: "arm64", intel: "x86_64"

  version "0.44.0"
  sha256 arm64_linux:  "fff27dc0bc61f606657efc74a48974b887174664a5fe89789a37d6a11aab40b6",
         x86_64_linux: "5b502801c8814c9fc5a2e8d9cfdf1c2ec5ee78b3e647f898704ad537a2ff452d"

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

  zap trash: [
    "~/.config/kitty",
  ]
end
