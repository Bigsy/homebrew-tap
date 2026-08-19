class Mcpmu < Formula
  desc "TUI for managing MCP (Model Context Protocol) servers"
  homepage "https://github.com/Bigsy/mcpmu"
  url "https://github.com/Bigsy/mcpmu/archive/refs/tags/v0.1.30.tar.gz"
  sha256 "8630cdd67c318425f1e6704eb8b3e762c03c3a01682bbb0029b4ad4cd8b17eb1"
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