class TransparentSops < Formula
  desc "Transparent git encryption tool using SOPS"
  homepage "https://github.com/j-waters/transparent-sops"
  url "https://github.com/j-waters/transparent-sops/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "aa9c6f714259aece9ad4d73b26965e54ba19f3624d8ec587af766d5f973d1f38"
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
