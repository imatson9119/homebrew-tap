class CurlSnap < Formula
  desc "Render a curl request and response as a clean, shareable image"
  homepage "https://github.com/imatson9119/curl-snap"
  url "https://registry.npmjs.org/curl-snap/-/curl-snap-2.5.2.tgz"
  sha256 "b5463c5bd296a5a31c312fae3d7c0e920c0338754657f5de546f605adb3c5442"
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
