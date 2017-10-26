cask 'mixed-in-key' do
  version '8.1.2.3598'
  sha256 '36d853f2811d166098648bb2847a2987d25e67a5ab5c4e0aa9c59cdda279b596'

  url 'https://builds.mixedinkey.com/download/39/release/latest?key=' + ENV['MIXED_IN_KEY']
  name 'Mixed In Key'
  homepage 'http://mixedinkey.com/'

  auto_updates true

  app "Mixed In Key #{version.major}.app"

  uninstall delete: [
                      '~/Library/Caches/com.mixedinkey.application',
                      '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.mixedinkey.application.sfl',
                    ],
            rmdir:  '~/Library/Application Support/Mixedinkey'

  zap trash: [
               '~/Library/Application Support/Mixedinkey',
               '~/Library/Preferences/com.mixedinkey.application.plist',
             ]
end
