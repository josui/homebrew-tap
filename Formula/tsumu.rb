class Tsumu < Formula
  desc "Local-first CLI bookmark manager"
  homepage "https://github.com/josui/tsumu-cli"
  url "https://github.com/josui/tsumu-cli/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "21b54da238eb476afb6369b63ece7505feb28fb4ae6c50a20c6a05104e93fa08"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
    bin.install_symlink "tsumu" => "tm"
  end

  test do
    assert_match "tsumu", shell_output("#{bin}/tsumu --help")
  end
end
