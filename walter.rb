require 'formula'
class Walter < Formula
  homepage 'http://ainoya.io/walter'
  version '0.2.0'

  depends_on :arch => :intel

  if Hardware.is_64_bit?
    url 'https://github.com/walter-cd/walter/releases/download/v0.2.0/walter_darwin_amd64.zip'
    sha256 '664cbab26e556d2da737de7ca384a40bf358ecd02898e7aa5d0c1393f711b55b'
  else
    url 'https://github.com/walter-cd/walter/releases/download/v0.2.0/walter_darwin_386.zip'
    sha256 '17e73d129582ae0309509a2fdda4437b82900436b60d7fae22ebd4349f74ab3c'
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
        - stage_name: Notify the beggining of process pipeline
          command: echo "build pipeline is started"
          message: true
    EOS
    system "#{bin}/walter"
  end
end

