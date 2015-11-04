require 'formula'
class Walter < Formula
  homepage 'http://ainoya.io/walter'
  version '1.3.0'

  depends_on :arch => :intel

  if Hardware.is_64_bit?
    url 'https://github.com/walter-cd/walter/releases/download/v1.3.0/walter_1.3.0_darwin_amd64.zip'
    sha256 '5a1797a6daef548e136628db97e357ef19bc5a95583b749cee99a02de1298ab3'
  else
    url 'https://github.com/walter-cd/walter/releases/download/v1.3.0/walter_1.3.0_darwin_386.zip'
    sha256 '74077cf2e22319ad1b88a9904123328978208774faf69d8dc5b2299e4582943c'
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

