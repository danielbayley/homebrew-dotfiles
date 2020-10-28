cask "icon-tester" do
  version "1.0"
  sha256 "1c7fe01951d79df18d85b2b0217c285d0161f6a91a18c91b375bf62d632a58d8"

  hash = "1192982262-b0fe4f19-698ebf6f"
  url "https://download.informer.com/mac-#{hash}/icontester.zip"
  appcast "https://macdownload.informer.com/icon-tester/download"
  name "Icon Tester"
  desc "Test out icon image files in the dock"
  homepage "https://macdownload.informer.com/icon-tester/#{version}"

  app "#{name.first}/#{name.first}.app"

  zap delete: "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adriankenny.icon-tester.sfl*"
end
