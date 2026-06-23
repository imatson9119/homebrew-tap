class CurlSnap < Formula
  desc "Turn a curl request into a polished PNG for PR evidence"
  homepage "https://github.com/imatson9119/curl-snap"
  url "https://registry.npmjs.org/curl-snap/-/curl-snap-1.0.0.tgz"
  sha256 "9ba54077ee37125bffc5b9494a603aecb8095241771e4b669ec4d6941d2d3f6f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      curl-snap renders cards with a headless browser, so you'll need Chrome,
      Chromium, Edge, or Brave installed. It will not download one for you.
      If you don't have one yet:
        brew install --cask google-chrome
    EOS
  end

  test do
    assert_match "curl-snap #{version}", shell_output("#{bin}/curl-snap --version")
  end
end
