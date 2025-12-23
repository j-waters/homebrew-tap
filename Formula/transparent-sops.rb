class TransparentSops < Formula
  desc "Transparent git encryption tool using SOPS"
  homepage "https://github.com/j-waters/transparent-sops"
  url "https://github.com/j-waters/transparent-sops/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "d8b495e32aa55cc37aec4182f0fa07c9b5a160d5f4c36688c183a7fac856c055"
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
