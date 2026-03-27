class Tsumu < Formula
  desc "Local-first CLI bookmark manager"
  homepage "https://github.com/josui/tsumu-cli"
  url "https://github.com/josui/tsumu-cli/archive/refs/tags/v0.0.14.tar.gz"
  sha256 "bf944a137f860642c71c622bae12d7d2c88d68f463074d5a9e5355e4aa21dfdd"
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
