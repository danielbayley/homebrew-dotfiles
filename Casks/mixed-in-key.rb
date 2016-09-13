cask 'mixed-in-key' do
  version '8.0.0.3343'
  sha256 '3861404ce7817bc54e9981194ddfc2f80a0fda784c2ce6027567e9942c3efebb'

  url ENV['MIXED_IN_KEY'].gsub 'VERSION', version
  name 'Mixed In Key'
  homepage 'http://mixedinkey.com'
  license :commercial

  app "Mixed In Key #{version.major}.app"
  auto_updates true

  uninstall rmdir: '~/Library/Application Support/Mixedinkey'
            #trash: '~/Library/Preferences/com.mixedinkey.application.plist'
  zap delete: [
        '~/Library/Application Support/Mixedinkey',
        '~/Library/Application Support/com.mixedinkey.application',
        #~/Library/Application Support/*[Mm]ixedinkey*
        '~/Library/Preferences/com.mixedinkey.application.plist',
        '~/Library/Preferences/com.mixedinkey.application.plist.lockfile',
        #~/Library/Preferences/com.mixedinkey*.plist*
        '~/Library/Caches/com.mixedinkey.application',
        '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.mixedinkey.application.sfl'
      ]
end
