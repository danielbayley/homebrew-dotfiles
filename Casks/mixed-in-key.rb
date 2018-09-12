cask 'mixed-in-key' do
  version '8.5.0.3877'
  sha256 'b42e8d6fc2ae7518029fa2ec4a360313f4513e054b73e82fd345a57b7a60208f'

  url "https://builds.mixedinkey.com/download/39/release/latest?key=#{ENV['MIXED_IN_KEY']}"
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
