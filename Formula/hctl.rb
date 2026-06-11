class Hctl < Formula
  desc "Polished OpenAPI-backed command-line interface for Harness APIs"
  homepage "https://github.com/imatson9119/harness-cli"
  url "https://github.com/imatson9119/harness-cli/releases/download/v0.3.0/hctl.pyz"
  sha256 "a9a9333d9e743060925e03dd3838031f22fc616d892965050f42a5af425afa73"
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
