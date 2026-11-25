class Rex < Formula
  desc "Terminal music player for Plex Media Server libraries"
  homepage "https://github.com/defaultdino/rex"
  url "https://github.com/defaultdino/rexamp/archive/refs/tags/v3.3.0.tar.gz"
  sha256 "6265899af45b27156ca2aa37970798544595216e367b57b0fbb2eb67b4a4a49c"
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
