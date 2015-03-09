require 'formula'
class Walter < Formula
  homepage 'http://ainoya.io/walter'
  version '1.0.0'

  depends_on :arch => :intel

  if Hardware.is_64_bit?
    url 'https://github.com/walter-cd/walter/releases/download/v1.0.0/walter_darwin_amd64.zip'
    sha256 '25d0fe4fc1e9a2301aaf8643570f23f6568e2c1241ca9ff313b623ad4715bfcd'
  else
    url 'https://github.com/walter-cd/walter/releases/download/v1.0.0/walter_darwin_386.zip'
    sha256 '2855c0b4fe95d5d075f9acaf2147a5b7ea8d1579a0bd7dfeef9bd235ddfaf18b'
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

