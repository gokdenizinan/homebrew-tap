# frozen_string_literal: true

# Terminal client for the Momentum Grids habit tracker.
class Momentum < Formula
  desc "Focus timers and today's habits for Momentum Grids, in your terminal"
  homepage "https://github.com/gokdenizinan/momentum-cli"
  url "https://github.com/gokdenizinan/momentum-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "71b6114fc0fef2958b426742344937232ac193f4045335e5a3b2624de93d146e"
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
