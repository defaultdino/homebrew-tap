class Rex < Formula
  desc "Terminal music player for Plex Media Server libraries"
  homepage "https://github.com/defaultdino/rex"
  url "https://github.com/defaultdino/rex/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "ade6453d823bf1a249ecc0de769df2add631f51e6bf370844be86b4d2bac09a6"
  license "MIT"
  head "https://github.com/defaultdino/rex.git", branch: "main"

  depends_on "rust" => :build

  on_linux do
    depends_on "pkgconf" => :build
    depends_on "alsa-lib"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rex --version")
  end
end
