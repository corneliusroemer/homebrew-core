class Jove < Formula
  desc "Emacs-style editor with vi-like memory, CPU, and size requirements"
  homepage "https://directory.fsf.org/wiki/Jove"
  url "https://github.com/jonmacs/jove/archive/refs/tags/4.17.4.9.tar.gz"
  sha256 "6d9aeb85c04fedac7e3df2a1716e014dc53d6938f665fc32a9facd40c117102d"

  bottle do
    sha256 arm64_ventura:  "b201d1acdef17d2d3a74b4c6aa7d6e59e4c9d74ee208ef508b56017441ac719c"
    sha256 arm64_monterey: "7a4e8fb6e7fb7fbe40fe89e458fa7e1fbd991ebaa1d1ba68c112bc0734603375"
    sha256 arm64_big_sur:  "410dc581e7eae19afab271eea74bd002fc7e48d4cfded7e4e8de33a277dc38b7"
    sha256 ventura:        "cb3c2c213e96ac706693f3c736a0fde618508226e13dea8080a73dacc974a9e8"
    sha256 monterey:       "8cc9a947664f8284103b39ff1a2969f43c176a85e2d408add27d7575a8da855b"
    sha256 big_sur:        "d1e6814d17f0e79e20c2a0aea2791fb2d045621c89d84d9eba29358dfe284717"
    sha256 catalina:       "c232b6742b25b3ca53a7c5da2c2577d4bed34e244b2cf90a61e5a5a8ade20e7a"
    sha256 mojave:         "8ee0b5bfd6d4dab4b56551dc1bd5cf8b03909f833d90fb213be0c16babbb88af"
    sha256 high_sierra:    "852bb69e61f542d5741b4a442c72c8f72304468d0c1101c2843b1c272111a6d1"
    sha256 sierra:         "a4559511caca50cf08e01049dda2a35a9423b5c976bf0d930ba819afebc1387b"
    sha256 el_capitan:     "c083761f33516e9d18718b6f78f6468b9aa72c0c80bb625987c60c05cc4f1895"
    sha256 x86_64_linux:   "16b980f6ffc7e4d3d3ee8a98d89b9e3786b630e6847130fe412ea7dac5d17050"
  end

  uses_from_macos "ncurses"

  on_system :linux, macos: :ventura_or_newer do
    depends_on "groff" => :build
  end

  def install
    bin.mkpath
    man1.mkpath
    (lib/"jove").mkpath

    system "make", "install", "JOVEHOME=#{prefix}", "DMANDIR=#{man1}"
  end

  test do
    assert_match "There's nothing to recover.", shell_output("#{lib}/jove/recover")
  end
end
