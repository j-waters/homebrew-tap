cask "rquickshare" do
  version "0.11.5"
  sha256 "a8d1e63617b270f702b8fdf35deb283b9b1bfbfec3cc1b3cf0370f5a1432b2cb"

  url "https://github.com/Martichou/rquickshare/releases/download/v#{version}/r-quick-share-legacy_v#{version}_glibc-2.31_amd64.AppImage"
  name "RQuickShare"
  desc "NearbyShare/QuickShare for Linux"
  homepage "https://github.com/Martichou/rquickshare"

  livecheck do
    url :url
    strategy :github_latest
  end

  container type: :naked

  shimscript = "#{staged_path}/rquickshare.wrapper.sh"
  binary shimscript, target: "rquickshare"

  preflight do
    File.write shimscript, <<~SH
      #!/bin/sh
      exec env WEBKIT_DISABLE_COMPOSITING_MODE=1 '#{staged_path}/r-quick-share-legacy_v#{version}_glibc-2.31_amd64.AppImage' "$@"
    SH
    set_permissions [shimscript], "0755"
    set_permissions ["#{staged_path}/r-quick-share-legacy_v#{version}_glibc-2.31_amd64.AppImage"], "0755"
  end

  postflight do
    applications_dir = "#{Dir.home}/.local/share/applications"
    FileUtils.mkdir_p(applications_dir)
    File.write("#{applications_dir}/rquickshare.desktop", <<~DESKTOP)
      [Desktop Entry]
      Version=1.0
      Type=Application
      Name=RQuickShare
      Comment=NearbyShare/QuickShare for Linux
      Exec=rquickshare
      Icon=dev.mandre.rquickshare
      Categories=Network;FileTransfer;
      StartupNotify=true
      Keywords=share;nearby;quickshare;transfer;
    DESKTOP
  end

  uninstall_postflight do
    FileUtils.rm("#{Dir.home}/.local/share/applications/rquickshare.desktop", force: true)
  end

  zap trash: "~/.local/share/dev.mandre.rquickshare"

  caveats <<~EOS
    RQuickShare requires one of the following system libraries to be installed:
      libayatana-appindicator or libappindicator3

    Both devices must be on the same Wi-Fi network for sharing to work.
  EOS
end
