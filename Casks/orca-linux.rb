cask "orca-linux" do
  arch arm: "-arm64"

  version "1.4.188"
  sha256 arm64_linux:  "edb96cf68e4c5d9442b913e82cad5b6c23a6399f8398e8f4798955bbb9c94918",
         x86_64_linux: "2e70cb5e199741e5602a7060825575319f5e03bc2faa4b89cd27328f3f55d4b4"

  url "https://github.com/stablyai/orca/releases/download/v#{version}/orca-linux#{arch}.AppImage"
  name "Orca"
  desc "IDE for orchestrating AI coding agents across terminals and worktrees"
  homepage "https://onorca.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Why: electron-updater (src/main/updater.ts) handles in-place updates the
  # same way it does on macOS, this time rewriting the AppImage itself. That
  # keeps `brew upgrade` a no-op unless --greedy, matching the upstream cask.
  auto_updates true
  depends_on :linux

  app_image "orca-linux#{arch}.AppImage", target: "Orca.AppImage"

  # Why: mirrors the upstream cask's zap list. Orca writes worktree/agent
  # state under ~/.orca regardless of platform; ~/.config and ~/.cache are
  # Electron's standard Linux userData/cache dirs (the counterparts to
  # ~/Library/Application Support and ~/Library/Caches on macOS).
  zap trash: [
    "~/.cache/Orca",
    "~/.config/Orca",
    "~/.orca",
  ]
end
