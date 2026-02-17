# frozen_string_literal: true

cask "kitty-linux" do
  arch arm: "arm64", intel: "x86_64"

  version "0.44.0"
  sha256 arm64_linux:  "fff27dc0bc61f606657efc74a48974b887174664a5fe89789a37d6a11aab40b6",
         x86_64_linux: "5b502801c8814c9fc5a2e8d9cfdf1c2ec5ee78b3e647f898704ad537a2ff452d"

  url "https://github.com/kovidgoyal/kitty/releases/download/v#{version}/kitty-#{version}-#{arch}.txz"
  name "kitty"
  desc "GPU-based terminal emulator"
  homepage "https://github.com/kovidgoyal/kitty"

  binary "#{staged_path}/bin/kitty"
  binary "#{staged_path}/bin/kitten"
end
