# m4, m22: the formula for the tap repo solozerolabs/homebrew-tap (Formula/salesmap.rb), so
# `brew install solozerolabs/tap/salesmap` installs the npm package (the thin client, apps/cli/src/thin.ts). After each `npm publish`, set
# `url` to the new version and `sha256` to `curl -sL <url> | shasum -a 256`.
class Salesmap < Formula
  desc "Checked buying signals and lead lists for your agent: hosted tools and a stdio MCP relay"
  homepage "https://salesmap.site"
  url "https://registry.npmjs.org/salesmap/-/salesmap-0.2.0.tgz"
  sha256 "caba7125cc0f344e3029a56b45eff5f5158f3d7c1d0f32155d488a1d66113eab"
  license :cannot_represent

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "usage: salesmap", shell_output("#{bin}/salesmap 2>&1", 1)
  end
end
