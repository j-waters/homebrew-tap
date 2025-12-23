class TransparentSops < Formula
  desc "Transparent git encryption tool using SOPS"
  homepage "https://github.com/j-waters/transparent-sops"
  url "https://github.com/j-waters/transparent-sops/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "4744012b4cfc6fe136f9c99596c36f2ff9f8956524fa10ca5ba7ac3c16190eb6"
  license "MIT"

  depends_on "sops"

  def install
    bin.install "transparent-sops"
  end

  test do
    # Verify the script runs and shows usage
    assert_match "Usage:", shell_output("#{bin}/transparent-sops", 1)
  end
end
