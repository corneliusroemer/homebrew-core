class TsvUtils < Formula
  desc "Command-line utilities for tabular data files (TSV)"
  homepage "https://github.com/eBay/tsv-utils"
  url "https://github.com/eBay/tsv-utils/archive/refs/tags/v2.2.1.tar.gz"
  sha256 "daf6e88bff1843e69c066453ed384869eec0e497914a6a9c260791ef91d95241"
  license "BSL-1.0"

  depends_on "ldc" => :build
  depends_on "make" => :build

  def install
    system "make", "DCOMPILER=ldc2", "LDC_PGO=2"
    bin.install Dir["bin/*"]
  end

  test do
    system "#{bin}/tsv-select", "--help"
  end
end
