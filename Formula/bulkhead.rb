class Bulkhead < Formula
  desc "Hardened devcontainer CLI for local agent work"
  homepage "https://github.com/pmembrey/bulkhead"
  url "https://github.com/pmembrey/bulkhead/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "08994ea95ac51eece7fa06a774259d4bf6bc18c090e955a9d0123b3b25d47dea"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/pmembrey/bulkhead.git", branch: "main"

  depends_on "rust" => :build
  depends_on "devcontainer"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    workspace = testpath/"workspace"
    workspace.mkpath

    system bin/"bulkhead", "template", workspace, "--yes"

    assert_path_exists workspace/"bulkhead.toml"
    assert_path_exists workspace/".devcontainer/devcontainer.json"
  end
end
