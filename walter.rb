require 'formula'
class Walter < Formula
  homepage 'http://ainoya.io/walter'
  version '0.1.0'

   depends_on :arch => :intel

   if Hardware.is_64_bit?
     url 'https://github.com/walter-cd/walter/releases/download/v0.1.0/walter_darwin_amd64.zip'
     sha256 '0c66ab823c87d63e130b1ed09d61b4bebb9e7499'
   else
     url 'https://github.com/walter-cd/walter/releases/download/v0.1.0/walter_darwin_386.zip'
     sha256 '9c8fbf922d5b8441df516bf51e3887c7f0285beb'
   end

   def install
     bin.install Dir['*']
   end
end

