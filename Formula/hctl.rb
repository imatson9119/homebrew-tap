class Hctl < Formula
  desc "Polished OpenAPI-backed command-line interface for Harness APIs"
  homepage "https://github.com/imatson9119/harness-cli"
  url "https://github.com/imatson9119/harness-cli/releases/download/v0.1.0/hctl.pyz"
  sha256 "5ccf59968827d27a659028a24e5339e5b1e8c9612ea418530198c88363b0b66d"
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
