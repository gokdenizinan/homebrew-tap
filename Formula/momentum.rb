# frozen_string_literal: true

# Terminal client for the Momentum Grids habit tracker.
class Momentum < Formula
  desc "Focus timers and today's habits for Momentum Grids, in your terminal"
  homepage "https://github.com/gokdenizinan/momentum-cli"
  url "https://github.com/gokdenizinan/momentum-cli/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "1011f6d4dcaef037f255f1048dd5be702614f6c70fa12f188864083d11d88329"
  license "MIT"

  # Standard library only; macOS's built-in Python 3.9+ is enough.
  uses_from_macos "python"

  def install
    bin.install "momentum_cli.py" => "momentum"
    generate_completions_from_executable(bin/"momentum", "completion")
  end

  test do
    assert_match "momentum #{version}", shell_output("#{bin}/momentum --version")
    assert_match "Get started", shell_output("#{bin}/momentum --help")
    ENV["MOMENTUM_CONFIG_DIR"] = testpath/"config"
    assert_match "Not signed in", shell_output("#{bin}/momentum status 2>&1", 1)
  end
end
