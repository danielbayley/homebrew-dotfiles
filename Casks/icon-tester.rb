cask 'icon-tester' do
  version '1.0'
  sha256 '1c7fe01951d79df18d85b2b0217c285d0161f6a91a18c91b375bf62d632a58d8'

  # kennyadr.com was verified as official when first introduced to the cask
  url 'http://kennyadr.com/archives/icontester.zip'
  name 'Icon Tester' # https://github.com/aroben/IconTester
  homepage 'https://dribbble.com/shots/47777-Icon-Tester'

  app "#{name[0]}/#{name[0]}.app"

  zap delete: ['~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adriankenny.icon-tester.sfl']
end
