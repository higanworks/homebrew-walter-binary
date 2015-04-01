require 'formula'
class Walter < Formula
  homepage 'http://ainoya.io/walter'
  version '1.1.0'

  depends_on :arch => :intel

  if Hardware.is_64_bit?
    url 'https://github.com/walter-cd/walter/releases/download/v1.1.0/walter_darwin_amd64.zip'
    sha256 '6c4e1e758c7da6af9d2a1488c1d7870d09ec1f49901d26fd63d830cec3ce89b2'
  else
    url 'https://github.com/walter-cd/walter/releases/download/v1.1.0/walter_darwin_386.zip'
    sha256 '1a16ff438d9d3964956288ffca2a2a405cc51b8e7820b862a0c104f62a2e3404'
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

