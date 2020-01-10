cask 'icon-tester' do
  version '1.0'
  sha256 '1c7fe01951d79df18d85b2b0217c285d0161f6a91a18c91b375bf62d632a58d8'

  url 'https://download.informer.com/mac-1192982262-b0fe4f19-698ebf6f/icontester.zip'
  appcast 'https://macdownload.informer.com/icon-tester/download'
  name 'Icon Tester'
  homepage "https://macdownload.informer.com/icon-tester/#{version}"

  app "#{name.first}/#{name.first}.app"

  zap delete: '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adriankenny.icon-tester.sfl*'
end
