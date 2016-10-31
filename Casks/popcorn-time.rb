cask 'popcorn-time' do
  version '0.3.10'
  sha256 '7d2cd37837963df8bb3c3c8601e44142a8314ac71e943f544f9a638da1c1330f'

  url "https://popcorntime.sh/download/build/Popcorn-Time-#{version}-Mac.zip"
  name 'Popcorn-Time'
  homepage 'https://popcorntime.sh'

  app 'Popcorn-Time.app', target: 'Popcorn Time.app'

  uninstall rmdir: '~/Library/Application Support/Popcorn-Time'
  zap delete: [
        '~/Library/Application Support/Popcorn-Time',
        '~/Library/Saved Application State/com.nw-builder.popcorn-time.savedState',
        '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.nw-builder.popcorn-time.sfl'
      ]
end
