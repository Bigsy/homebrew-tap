class Mcpmu < Formula
  desc "TUI for managing MCP (Model Context Protocol) servers"
  homepage "https://github.com/Bigsy/mcpmu"
  url "https://github.com/Bigsy/mcpmu/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "b345cc5feecd1ee874cd8dc961d68cf7006cbfb0a8accd5c1cac85e5368d79e9"
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