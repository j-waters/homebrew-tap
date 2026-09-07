cask "orca-linux" do
  arch arm: "-arm64"

  version "1.4.197"
  sha256 arm64_linux:  "9a6c9cc3be3f9886efa8d75d16ba3401a029cd261235a86b84cd1c2436139271",
         x86_64_linux: "4bc8462d151ff010faa54c646bb16dcc5474bf664eed5ec5028182d79926416b"

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
  # Why: a stable, arch-independent launch path. app_image moves the real
  # AppImage to ~/Applications/Orca.AppImage on every (re)install, so this
  # symlink survives upgrades even though the versioned Caskroom path behind
  # it doesn't. install-steps blocks may only contain literal step calls - no
  # interpolated Ruby - so `{{HOMEBREW_PREFIX}}` (a supported template token)
  # is the only way to embed an absolute launch path in the .desktop file
  # below; `#{Dir.home}` isn't available there the way it is here.
  binary "#{Dir.home}/Applications/Orca.AppImage", target: "orca"

  # Why: app_image only moves the AppImage into ~/Applications - unlike macOS
  # Cask, brew's Linux app_image stanza has no Launch Services equivalent, so
  # nothing registers a menu entry or icon on its own. Unlike kitty/warp (real
  # archives Cask auto-unpacks, so their artifact stanzas just point at files
  # already on disk), an AppImage stays one opaque file - its icon has to be
  # pulled out via its own --appimage-extract fallback (no FUSE/root needed)
  # before it can be referenced.
  postflight_steps do
    run "Applications/Orca.AppImage",
        base:  :home,
        args:  ["--appimage-extract", "usr/share/icons/hicolor/512x512/apps/orca-ide.png"],
        chdir: "."

    copy "squashfs-root/usr/share/icons/hicolor/512x512/apps/orca-ide.png",
         ".local/share/icons/hicolor/512x512/apps/orca.png",
         target_base: :home
    remove "squashfs-root", recursive: true

    write_file ".local/share/applications/orca.desktop", <<~DESKTOP, base: :home
      [Desktop Entry]
      Version=1.0
      Type=Application
      Name=Orca
      Comment=IDE for orchestrating AI coding agents across terminals and worktrees
      Exec="{{HOMEBREW_PREFIX}}/bin/orca" %U
      Icon=orca
      Categories=Development;
      StartupNotify=true
      StartupWMClass=orca
      Keywords=ai;coding;agent;claude;codex;
    DESKTOP
  end

  uninstall_postflight_steps do
    remove ".local/share/applications/orca.desktop", base: :home
    remove ".local/share/icons/hicolor/512x512/apps/orca.png", base: :home
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
