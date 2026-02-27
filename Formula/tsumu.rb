class Tsumu < Formula
  desc "Local-first CLI bookmark manager"
  homepage "https://github.com/josui/tsumu-cli"
  url "https://github.com/josui/tsumu-cli/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "2bb591d23413a7016589b68eb1450c326cda0dc702cb79bd60a61eabab035c6a"
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
