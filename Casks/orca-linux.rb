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

  # Why: app_image only symlinks the AppImage into ~/Applications - unlike
  # macOS Cask, brew's Linux app_image stanza has no Launch Services
  # equivalent, so nothing registers a menu entry or icon on its own. Unlike
  # kitty/warp (real archives Cask auto-unpacks, so their artifact stanzas
  # just point at files already on disk), an AppImage stays one opaque file -
  # its icon has to be pulled out via its own --appimage-extract fallback
  # (no FUSE/root needed) before it can be referenced.
  postflight do
    appimage_path = "#{staged_path}/orca-linux#{arch}.AppImage"
    icon = "usr/share/icons/hicolor/512x512/apps/orca-ide.png"
    system_command appimage_path, args: ["--appimage-extract", icon], chdir: staged_path

    icon_dir = "#{Dir.home}/.local/share/icons/hicolor/512x512/apps"
    FileUtils.mkdir_p(icon_dir)
    FileUtils.cp("#{staged_path}/squashfs-root/#{icon}", "#{icon_dir}/orca.png")
    FileUtils.rm_rf("#{staged_path}/squashfs-root")

    applications_dir = "#{Dir.home}/.local/share/applications"
    FileUtils.mkdir_p(applications_dir)
    File.write("#{applications_dir}/orca.desktop", <<~DESKTOP)
      [Desktop Entry]
      Version=1.0
      Type=Application
      Name=Orca
      Comment=IDE for orchestrating AI coding agents across terminals and worktrees
      Exec="#{Dir.home}/Applications/Orca.AppImage" %U
      Icon=orca
      Categories=Development;
      StartupNotify=true
      StartupWMClass=orca
      Keywords=ai;coding;agent;claude;codex;
    DESKTOP
  end

  uninstall_postflight do
    FileUtils.rm("#{Dir.home}/.local/share/applications/orca.desktop", force: true)
    FileUtils.rm("#{Dir.home}/.local/share/icons/hicolor/512x512/apps/orca.png", force: true)
  end

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
