class Aliaspath < Formula
  desc "Prints the POSIX path to the original of a Finder alias"
  homepage "https://github.com/rptb1/aliasPath"
  url "#{homepage}/archive/master.tar.gz"
  version "1.0"
  sha256 "e3b86bac513b804f788bf1cf6f95c3803a96fcd9f2af0ffaf0647851a4aa0c9f"

  depends_on xcode: :build
  depends_on :macos

  def install
    xcodebuild "-arch", Hardware::CPU.arch, "SYMROOT=build"
    bin.install "build/Release/#{@name}"
  end

  test { system bin/@name }
end
