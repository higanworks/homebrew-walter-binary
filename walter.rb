require 'formula'
class Walter < Formula
  homepage 'http://ainoya.io/walter'
  version '0.1.0'

  depends_on :arch => :intel

  if Hardware.is_64_bit?
    url 'https://github.com/walter-cd/walter/releases/download/v0.1.0/walter_darwin_amd64.zip'
    sha256 'ebe31bfea6f298576fc8a6169e94374012d49039e7823f0e4f998d1e2305feb6'
  else
    url 'https://github.com/walter-cd/walter/releases/download/v0.1.0/walter_darwin_386.zip'
    sha256 'e200eb30c06269b1781925def75054db39aa029b39bb6255078012530a1e5af7'
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

