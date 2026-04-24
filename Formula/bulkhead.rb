class Bulkhead < Formula
  desc "Hardened devcontainer CLI for local agent work"
  homepage "https://github.com/pmembrey/bulkhead"
  url "https://github.com/pmembrey/bulkhead/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "4025d6edbf9f6867c25f1f6efaeecc64f28c658bb34532044ebcafbfbc155bc4"
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
