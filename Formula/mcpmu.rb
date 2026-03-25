class Mcpmu < Formula
  desc "TUI for managing MCP (Model Context Protocol) servers"
  homepage "https://github.com/Bigsy/mcpmu"
  url "https://github.com/Bigsy/mcpmu/archive/refs/tags/v0.1.18.tar.gz"
  sha256 "b1bbc45b73601994a0bd634569a2a2ca7468e4b1222450b1c7601542d83600d9"
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