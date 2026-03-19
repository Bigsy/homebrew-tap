class Mcpmu < Formula
  desc "TUI for managing MCP (Model Context Protocol) servers"
  homepage "https://github.com/Bigsy/mcpmu"
  url "https://github.com/Bigsy/mcpmu/archive/refs/tags/v0.1.16.tar.gz"
  sha256 "bb1caaa77afc1745821b77b439556f523bb8359ef43fe97a2cd4dc8aa89323ea"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/mcpmu"
  end

  test do
    output = shell_output("#{bin}/mcpmu list 2>&1", 0)
    assert_match(/ID|Name|no servers configured/i, output)
  end
end