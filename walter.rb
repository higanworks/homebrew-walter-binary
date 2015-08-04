require 'formula'
class Walter < Formula
  homepage 'http://ainoya.io/walter'
  version '1.2.0'

  depends_on :arch => :intel

  if Hardware.is_64_bit?
    url 'https://github.com/walter-cd/walter/releases/download/v1.2.0/walter_1.2.0_darwin_amd64.zip'
    sha256 '0bcea802750b2c547975c7303c4743056bae15c225aca307d08dbf27580475b5'
  else
    url 'https://github.com/walter-cd/walter/releases/download/v1.2.0/walter_1.2.0_darwin_386.zip'
    sha256 'c47cd0ea3ef520d6bec95e6c4ad32d56ab29c5a4ac5ebabbfa1d78ef2f7fd2e1'
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

