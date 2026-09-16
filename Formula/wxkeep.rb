class Wxkeep < Formula
  desc "Dual-architecture anti-revoke toolchain for WeChat 4.x on macOS"
  homepage "https://github.com/0xGenesi/wechatkeep"
  version "0.1.2"
  license "AGPL-3.0"

  on_macos do
    url "https://github.com/0xGenesi/wechatkeep/releases/download/v0.1.2/wxkeep"
    sha256 "1775bcbbc80f1e1b606dfc7a52bd456259f95426a35480fa0dde63b963c84ba6"
  end

  def install
    bin.install "wxkeep"
    system "xattr", "-c", bin/"wxkeep"
  end

  test do
    system bin/"wxkeep", "--version"
  end
end
