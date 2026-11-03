class Rex < Formula
  desc "Terminal music player for Plex Media Server libraries"
  homepage "https://github.com/defaultdino/rex"
  url "https://github.com/defaultdino/rexamp/archive/refs/tags/v3.2.0.tar.gz"
  sha256 "08c3828d7c8f8ffe66e7ee27067b06aee815f501e6313eb8253241e98416bf55"
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
