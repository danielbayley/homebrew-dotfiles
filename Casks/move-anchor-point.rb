cask 'move-anchor-point' do
  version '4.0'
  sha256 'c64c641888e9db6bef86343870781cd125b487c32c69030c3e274d3d9ce9568d'

  url 'https://batchframe.com/c/?bfm=' + ENV['HOMEBREW_ADOBE_MOVE_ANCHOR_POINT']
  name 'Move Anchor Point'
  homepage "https://batchframe.com/tool/Move-Anchor-Point-#{version.major}"

  depends_on formula: 'exmancmd'

  installer script: {
                      executable: "#{HOMEBREW_PREFIX}/bin/exmancmd",
                      args:       ['--install', "#{staged_path}/MoveAnchorPoint-#{version}.zxp"],
                    }

  uninstall script: {
                      executable: "#{HOMEBREW_PREFIX}/bin/exmancmd",
                      args:       ['--remove', "Move Anchor Point #{version.major}"],
                    },
            trash:  '~/Library/Application Support/MoveAnchorPoint'

  caveats <<~EOS
    Cask requires a HOMEBREW_ADOBE_MOVE_ANCHOR_POINT environment variable to be
    set with the unique portion of the download url supplied in your email receipt.
    A license can be purchased at #{homepage}.
  EOS
end
