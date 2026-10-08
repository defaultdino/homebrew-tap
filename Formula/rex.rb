class Rex < Formula
  desc "Terminal music player for Plex Media Server libraries"
  homepage "https://github.com/defaultdino/rex"
  url "https://github.com/defaultdino/rex/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "104017cb97481da4c4811b45635b3446566c1aa305cd6c687e1e3f9106d3b5da"
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
