class Woff2sfntSfnt2woff < Formula
  desc "Font converter to convert woff2ttf, wof2otf & ttf2woff, otf2woff."
  homepage "https://github.com/odemiral/woff2sfnt-sfnt2woff"
  url "https://github.com/odemiral/woff2sfnt-sfnt2woff/archive/master.zip"
  version "1.0"
  sha256 "5b65da1f79b16f1674608bbea806d0bd9dcb142b5cceb02054c2f37d06f17dd6"

  depends_on "node"

  bottle :unneeded

  def install#_symlink TODO
    cli = Dir["*2*.js"]
    inreplace cli do |s|
      s.gsub! "./index", "../index"
    end
    for js in cli do
      exe = File.basename js, ".js"
      File.rename js, exe
      bin.install exe
    end
    prefix.install Dir["*"]
  end

  def post_install
    chmod 0555, Dir["#{bin}/*"]
  end

  test do
    system "#{bin}/sfnt2woff"
    system "#{bin}/woff2sfnt"
  end
end
