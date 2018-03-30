require 'formula'
class Walter < Formula
  homepage 'http://ainoya.io/walter'
  version '2.0.0-1'

  depends_on :arch => :intel

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/walter-cd/walter/releases/download/v2.0.0/walter_v2.0.0_darwin_amd64.zip'
    sha256 '7508f5f22cc4d510eef3f4db1849e6d6350c233ee4d627efb46e09208330faad'
  else
    url 'https://github.com/walter-cd/walter/releases/download/v2.0.0/walter_v2.0.0_darwin_386.zip'
    sha256 '2e317043d0a6430fa1224ede5499be88a9e3d01b41d0cf542d305810490e2ad4'
  end

  def install
    bin.install Dir['*']
  end

  test do
    minimal = testpath/"pipeline.yml"
    minimal.write <<-EOS.undent
      notify:
        - type: fake

      build:
        tasks:
          - stage: Notify the beggining of process pipeline
            command: echo "build pipeline is started"
            message: true
    EOS
    system "#{bin}/walter -build"
  end
end

