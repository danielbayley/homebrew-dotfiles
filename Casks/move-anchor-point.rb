cask "move-anchor-point" do
  version "4.0"
  sha256 "c64c641888e9db6bef86343870781cd125b487c32c69030c3e274d3d9ce9568d"

  envar = "HOMEBREW_ADOBE_#{token.upcase}"
  url "https://batchframe.com/c/?bfm=#{ENV[envar]}"
  name "Move Anchor Point"
  desc "Instantly and precisely move anchor points anywhere without moving the layer"
  homepage "https://batchframe.com/tool/#{token}-#{version.major}"

  depends_on formula: "exmancmd"

  installer script: {
    executable: "#{HOMEBREW_PREFIX}/bin/exmancmd",
    args:       ["--install", "#{staged_path}/MoveAnchorPoint-#{version}.zxp"],
  }

  uninstall script: {
    executable: "#{HOMEBREW_PREFIX}/bin/exmancmd",
    args:       ["--remove", "#{name.first} #{version.major}"],
  },
            trash:  "~/Library/Application Support/MoveAnchorPoint"

  caveats do
    license "https://batchframe.com/docs/licenses/software"
    <<~EOS
      Cask requires a #{envar} environment variable to be
      set with the unique portion of the download url supplied in your email receipt.
      A license can be purchased at #{@cask.homepage}.
    EOS
  end
end
