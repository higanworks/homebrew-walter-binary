require 'formula'
class Walter < Formula
  homepage 'http://ainoya.io/walter'
  version '1.4.0-2'

  depends_on :arch => :intel

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/walter-cd/walter/releases/download/v1.4.0/walter_1.4.0_darwin_amd64.zip'
    sha256 '29c03d6ff2563227947de18cd1cabba8085e9e763a50982bdc7aabc49f1f0fc0'
  else
    url 'https://github.com/walter-cd/walter/releases/download/v1.4.0/walter_1.4.0_darwin_386.zip'
    sha256 'be7e3575a16d32df733544141b75d1af50035b3cc658bc000dfc198a602cf628'
  end

  def install
    bin.install Dir['*']
  end

  test do
    minimal = testpath/"pipeline.yml"
    minimal.write <<-EOS.undent
      messenger:
        type: fake

      pipeline:
        - stage: Notify the beggining of process pipeline
          command: echo "build pipeline is started"
          message: true
    EOS
    system "#{bin}/walter"
  end
end

