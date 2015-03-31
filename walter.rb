require 'formula'
class Walter < Formula
  homepage 'http://ainoya.io/walter'
  version '1.1.0'

  depends_on :arch => :intel

  if Hardware.is_64_bit?
    url 'https://github.com/walter-cd/walter/releases/download/v1.1.0/walter_darwin_amd64.zip'
    sha256 '48db5c3ad0020435d0dc907da754ebfadafa7315e152c3e3402dc4ee34d91ae0'
  else
    url 'https://github.com/walter-cd/walter/releases/download/v1.1.0/walter_darwin_386.zip'
    sha256 '56e9a8ba8082332f4dfbce7a244e2382322b4263e2e54aa1d8957f21c6428013'
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

