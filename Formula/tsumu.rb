class Tsumu < Formula
  desc "Local-first CLI bookmark manager"
  homepage "https://github.com/josui/tsumu-cli"
  url "https://github.com/josui/tsumu-cli/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "dd2cfe4b543def210ac8620f0edb9723c5a8fc3ba2ba9096ef45e423d6f643b5"
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
