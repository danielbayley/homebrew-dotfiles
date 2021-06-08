cask "webscreen" do
  version "1.18"
  sha256 "4e8f2edab5f2f4adab5df742ce921080fef23c8811b4416316693532e24db86c"

  repo  = "https://github.com/paulsnar/#{token}"
  saver = "#{token.capitalize}.saver"

  url "#{repo}/releases/download/v#{version}/#{saver}.zip"
  name token.capitalize
  desc "Screensaver which displays web pages via WKWebView"
  homepage "#{repo}#readme"

  screen_saver saver
end
