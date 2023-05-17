class Iqtree2 < Formula
  desc "Efficient phylogenomic software by maximum likelihood"
  homepage "http://www.iqtree.org/"
  url "https://github.com/iqtree/iqtree2.git",
      tag:      "v2.2.2.5",
      revision: "ed050c36b1a4cacf220cb47ae6b40df6f2cf15c5"
  license "GPL-2.0-only"

  depends_on "boost" => :build
  depends_on "cmake" => :build
  depends_on "eigen" => :build
  depends_on "gsl"   => :build
  depends_on "libomp" => :build
  depends_on "llvm" => :build
  depends_on "open-mpi" => :build
  uses_from_macos "zlib"

  def install
    inreplace "CMakeLists.txt", "--target=arm64-apple-macos10.5", "-mmacosx-version-min=10.7"
    inreplace "CMakeLists.txt", "--target=arm64-apple-macos12.0.1", "-mmacosx-version-min=12.0.1"
    mkdir "build" do
      system "cmake", "..", "-DIQTREE_FLAGS=omp", "-DCMAKE_C_COMPILER=clang", "-DCMAKE_CXX_COMPILER=clang++"
      system "make", "-j"
      bin.install "iqtree2"
    end
  end

  test do
    system "#{bin}/iqtree2", "-v"
  end
end
