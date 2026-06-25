class CurlSnap < Formula
  desc "Render a curl request and response as a clean, shareable image"
  homepage "https://github.com/imatson9119/curl-snap"
  url "https://registry.npmjs.org/curl-snap/-/curl-snap-2.4.0.tgz"
  sha256 "da56b34cbd9a4e06e5744e73f702335e1e912d30b490fc3e807ca1bfc186ce5c"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "curl-snap #{version}", shell_output("#{bin}/curl-snap --version")
  end
end
