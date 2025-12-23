class TransparentSops < Formula
    desc "Transparent git encryption tool using SOPS"
    homepage "https://github.com/j-waters/transparent-sops"
    url "https://github.com/j-waters/transparent-sops/archive/refs/tags/v0.1.3.tar.gz"
    sha256 "04cbd4afc511e2b0cf31dada19547f2db9e6630064bff656ab1619fba4bc1672"
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
  