class Hctl < Formula
  desc "Polished OpenAPI-backed command-line interface for Harness APIs"
  homepage "https://github.com/imatson9119/harness-cli"
  url "https://github.com/imatson9119/harness-cli/releases/download/v0.2.1/hctl.pyz"
  sha256 "a3277b931cdc9a0cedd2af2dd9676d4a903bd405121ff24af572eea829aedac8"
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
