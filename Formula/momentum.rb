# frozen_string_literal: true

# Terminal client for the Momentum Grids habit tracker.
class Momentum < Formula
  desc "Focus timers and today's habits for Momentum Grids, in your terminal"
  homepage "https://github.com/gokdenizinan/momentum-cli"
  url "https://github.com/gokdenizinan/momentum-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "aa9574580fb27544c6f98c637c1b992b81bb2b1a1c4019b9155ddd8ef68cfd0a"
  license "MIT"

  # Standard library only; macOS's built-in Python 3.9+ is enough.
  uses_from_macos "python"

  def install
    bin.install "momentum_cli.py" => "momentum"
  end

  test do
    assert_match "Get started", shell_output("#{bin}/momentum --help")
    ENV["MOMENTUM_CONFIG_DIR"] = testpath/"config"
    assert_match "Not signed in", shell_output("#{bin}/momentum status 2>&1", 1)
  end
end
