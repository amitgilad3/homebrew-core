class Bitzz < Formula
  desc "Easily share code between projects with your team"
  homepage "https://bit.dev"
  url "https://github.com/teambit/bit/releases/download/v14.2.0/bit-bin-macos"
  version "14.2.0"
  sha256 "fe3e125bee0139364c48c1d404c78132ed69d4287d02a92bb73cb4c45f42ca2f"

  def install
    bin.install "bit-bin-macos"
    mv "bin/bit-bin-macos", "bin/bit"
  end

  test do
    (testpath/"Library/Caches/Bit/config/config.json").write <<~EOS
      { "analytics_reporting": false, "error_reporting": false }
    EOS
    output = shell_output("#{bin}/bit init --skip-update")
    assert_match "successfully initialized", output
  end
end
