class Tsumu < Formula
  desc "Local-first CLI bookmark manager"
  homepage "https://github.com/josui/tsumu-cli"
  url "https://github.com/josui/tsumu-cli/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "548a90c89629d5bdba30f4bb5f1147f7a364c9d5300903fd5dc2d4254d369d5a"
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
