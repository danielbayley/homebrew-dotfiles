cask "icon-tester" do
  version "1.0"
  sha256 "1c7fe01951d79df18d85b2b0217c285d0161f6a91a18c91b375bf62d632a58d8"

  # dropbox.com/s/ was verified as official when first introduced to the cask
  url "https://dropbox.com/s/8rvk6305526ounk/icontester.zip?dl=1"
  appcast "https://macdownload.informer.com/#{token}/versions"
  name "Icon Tester"
  desc "Test out icon image files in the dock"
  homepage "https://macdownload.informer.com/#{token}"

  app "#{name.first}/#{name.first}.app"

  preflight do
    system "/usr/bin/xattr", "-d", "com.apple.quarantine", @cask.artifacts.to_a[1].source
  end

  zap delete: "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adriankenny.icon-tester.sfl*"
end
