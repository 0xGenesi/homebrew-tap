class Wxkeep < Formula
  desc "Dual-architecture anti-revoke toolchain for WeChat 4.x on macOS"
  homepage "https://github.com/0xGenesi/wechatkeep"
  version "0.1.2"
  license "AGPL-3.0"

  on_macos do
    url "https://github.com/0xGenesi/wechatkeep/releases/download/v0.1.2/wxkeep"
    sha256 "38633786a3861fc779990881f43d042beec756b6cace39e86fc26a31eca1bf27"
  end

  resource "config" do
    url "https://raw.githubusercontent.com/0xGenesi/wechatkeep/v0.1.2/config.json"
    sha256 "d4e9ded4df46015456a3ff28bc4b51b1220b4b8ae11c961cebc03d2789e422ee"
  end

  resource "signatures" do
    url "https://raw.githubusercontent.com/0xGenesi/wechatkeep/v0.1.2/signatures.json"
    sha256 "642523f3f0db4a6a7437568e8e48595b30fd89e303be3f1e9683f090ec394f3b"
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
