class Wxkeep < Formula
  desc "Dual-architecture anti-revoke toolchain for WeChat 4.x on macOS"
  homepage "https://github.com/0xGenesi/wechatkeep"
  version "0.1.1"
  license "AGPL-3.0"

  on_macos do
    url "https://github.com/0xGenesi/wechatkeep/releases/download/v0.1.1/wxkeep"
    sha256 "5bbc271af51cb31331635d4fe292328771f89b233c8a3a26d40f5f5786973bd8"
  end

  def install
    bin.install "wxkeep"
    system "xattr", "-c", bin/"wxkeep"
  end

  test do
    system bin/"wxkeep", "--version"
  end
end
