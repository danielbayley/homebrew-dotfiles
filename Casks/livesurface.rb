cask "livesurface" do
  version "2.3.11"
  sha256 "6e3d4874e1fbc1ae570ad0cf4c1f461ef9de00ee7a94dd116f76efb50a26402b"

  url "https://account.#{token}.com/download/v#{version.major}/"
  name "LiveSurface"
  desc "Photo-real mockups"
  homepage "https://#{token}.com/"

  livecheck do
    url "https://web.api.#{@package_or_resource.token}.com/api/v1/sparkleUpdates"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "#{name.first}.app"

  domain = "com.#{token}.#{name.first}"

  zap trash: %W[
    ~/Documents/#{name.first}
    ~/Library/Application Scripts/#{domain}.ThumbnailExtension
    ~/Library/Application Support/#{name.first}
    ~/Library/Caches/#{domain}
    ~/Library/Caches/#{name.first}-Tutorials
    ~/Library/Containers/#{domain}.ThumbnailExtension
    ~/Library/HTTPStorages/#{domain}
    ~/Library/Preferences/com.#{token}.*.plist
    ~/Library/Saved Application State/#{domain}.savedState
    ~/Library/WebKit/#{domain}
  ]
end
