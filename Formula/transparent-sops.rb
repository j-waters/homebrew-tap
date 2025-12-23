class TransparentSops < Formula
    desc "Transparent git encryption tool using SOPS"
    homepage "https://github.com/j-waters/transparent-sops"
    url "https://github.com/j-waters/transparent-sops/archive/refs/tags/v0.1.2.tar.gz"
    sha256 "3f9731bba57d2174fdd6de28b44f34932c34631273fa050059af7e935f6a2895"
    license "MIT"
  
    depends_on "sops"
  
    def install
      bin.install "transparent-sops"
      libexec.install "filters"
    end
  
    test do
      # Verify the script runs and shows usage
      assert_match "Usage:", shell_output("#{bin}/transparent-sops", 1)
    end
  end
  