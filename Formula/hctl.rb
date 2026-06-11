class Hctl < Formula
  desc "Polished OpenAPI-backed command-line interface for Harness APIs"
  homepage "https://github.com/imatson9119/harness-cli"
  url "https://github.com/imatson9119/harness-cli/releases/download/v0.3.2/hctl.pyz"
  sha256 "9469918dfe15fc041ae09b0225f05cc831396561ea67b397fc6fa4da5a401a8e"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "hctl.pyz"
    (bin/"hctl").write <<~EOS
      #!/bin/bash
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/hctl.pyz" "$@"
    EOS
  end

  test do
    assert_match "hctl #{version}", shell_output("#{bin}/hctl --version")
    assert_match "operation_count", shell_output("#{bin}/hctl api info --json")
  end
end
