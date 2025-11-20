class XrplBedrock < Formula
  desc "XRPL smart contracts CLI tool"
  homepage "https://github.com/XRPL-Commons/Bedrock"
  url "https://github.com/XRPL-Commons/Bedrock/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "8f40cf37a9fb606fd234ea0345fb2623eb0c8cef49533cd30ca12e56750576f5"
  license "MIT"
  head "https://github.com/XRPL-Commons/Bedrock.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/bedrock"
  end

  test do
    assert_match "bedrock", shell_output("#{bin}/bedrock --help")
  end
end