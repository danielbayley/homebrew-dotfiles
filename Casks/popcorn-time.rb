cask 'popcorn-time' do
  version '0.3.9'
  sha256 '390c29cc9f4187cf068a0d53897528fb576d9e4076fd1fa47354086cc2d3770b'

  url "https://popcorntime.sh/download/build/Popcorn-Time-#{version}-Mac.tar.xz"
  name 'Popcorn-Time'
  homepage 'https://popcorntime.sh'
  license :gpl

  app 'Popcorn-Time.app', target: 'Popcorn Time.app'

  uninstall rmdir: '~/Library/Application Support/Popcorn-Time'
  zap delete: [
        '~/Library/Application Support/Popcorn-Time',
        '~/Library/Saved Application State/com.nw-builder.popcorn-time.savedState',
        '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.nw-builder.popcorn-time.sfl'
      ]
end
