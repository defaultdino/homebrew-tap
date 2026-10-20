class Rex < Formula
  desc "Terminal music player for Plex Media Server libraries"
  homepage "https://github.com/defaultdino/rex"
  url "https://github.com/defaultdino/rex/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "ff2164cc8e2e91a403d8ca90922abd080b482049823f3a26be8fa3c233aa74dd"
  license "MIT"
  head "https://github.com/defaultdino/rex.git", branch: "main"

  option "with-cast", "Build with casting support"

  depends_on "rust" => :build

  on_linux do
    depends_on "pkgconf" => :build
    depends_on "alsa-lib"
  end

  def install
    args = std_cargo_args
    args += ["--features", "cast"] if build.with? "cast"
    system "cargo", "install", *args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rex --version")
  end
end
