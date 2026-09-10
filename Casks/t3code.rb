cask "t3code" do
  version "0.0.13"
  sha256 "a0728887e687b1b1951c4a0b2e322d97a01b551c2f5959596885b21ca89e9157"

  url "https://github.com/pingdotgg/t3code/releases/download/v#{version}/T3-Code-#{version}-x86_64.AppImage"
  name "T3 Code"
  desc "Minimal web GUI for coding agents"
  homepage "https://github.com/pingdotgg/t3code"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :linux

  app_image "T3-Code-#{version}-x86_64.AppImage", target: "T3-Code.AppImage"
  binary "#{Dir.home}/Applications/T3-Code.AppImage", target: "t3code"

  artifact "share/applications/t3code.desktop",
           target: "#{Dir.home}/.local/share/applications/t3code.desktop"
end
