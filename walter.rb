require 'formula'
class Walter < Formula
  homepage 'http://ainoya.io/walter'
  version '1.3.0-3'

  depends_on :arch => :intel

  if Hardware.is_64_bit?
    url 'https://github.com/walter-cd/walter/releases/download/v1.3.0/walter_1.3.0_darwin_amd64.zip'
    sha256 '774e57e158baf593b9aabe9848b53a37f0dbf0a8143285cf6cf66080966561e6'
  else
    url 'https://github.com/walter-cd/walter/releases/download/v1.3.0/walter_1.3.0_darwin_386.zip'
    sha256 'fef347704e78515ceec1fab6fdf43bb7d87c2d0a51d1c810b2334b300edb5873'
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

