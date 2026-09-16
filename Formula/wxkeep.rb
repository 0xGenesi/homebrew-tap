class Wxkeep < Formula
  desc "Dual-architecture anti-revoke toolchain for WeChat 4.x on macOS"
  homepage "https://github.com/0xGenesi/wechatkeep"
  version "0.1.3"
  license "AGPL-3.0"

  on_macos do
    url "https://github.com/0xGenesi/wechatkeep/releases/download/v0.1.3/wxkeep"
    sha256 "d626f02b9549487492d459267388968ae3b3354243b9d6541d545d39affb31cf"
  end

  resource "config" do
    url "https://raw.githubusercontent.com/0xGenesi/wechatkeep/v0.1.2/config.json"
    sha256 "d626f02b9549487492d459267388968ae3b3354243b9d6541d545d39affb31cf"
  end

  resource "signatures" do
    url "https://raw.githubusercontent.com/0xGenesi/wechatkeep/v0.1.2/signatures.json"
    sha256 "d626f02b9549487492d459267388968ae3b3354243b9d6541d545d39affb31cf"
  end

  def install
    bin.install "wxkeep"
    system "xattr", "-c", bin/"wxkeep"
    # config/signatures 放 bin 旁（CLI 的本地优先搜索从可执行文件目录向上走）
    resource("config").stage { bin.install "config.json" }
    resource("signatures").stage { bin.install "signatures.json" }
  end

  test do
    system bin/"wxkeep", "--version"
  end
end
