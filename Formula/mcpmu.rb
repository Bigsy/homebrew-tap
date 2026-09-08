class Mcpmu < Formula
  desc "TUI for managing MCP (Model Context Protocol) servers"
  homepage "https://github.com/Bigsy/mcpmu"
  url "https://github.com/Bigsy/mcpmu/archive/refs/tags/v0.1.33.tar.gz"
  sha256 "c3c6414123111f5ebb3d103c1ca1bdbdab623f509c1a2c276aa1c4f7f17cc956"
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