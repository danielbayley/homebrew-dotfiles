cask 'alfred-things' do
  GITHUB_USER = Tap.find { |tap| tap.name.end_with? '/alfred' }.user
  extend = CaskLoader.load "#{GITHUB_USER}/alfred/#{token}"

  version extend.version
  sha256 extend.sha256

  url "https://culturedcode.com/frozen/#{version.after_comma.major}/#{version.after_comma.minor}/Add-To-Do-to-Things-#{version.major}.alfredworkflow.zip"
  appcast extend.appcast.uri
  name extend.name
  homepage 'https://support.culturedcode.com/customer/en/portal/articles/2803574-creating-to-dos-with-a-launcher'

  conflicts_with cask: "homebrew/cask/#{token}"
  depends_on extend.depends_on

  artifact staged_path, target: extend.artifacts.to_a.first.target

  preflight do
    subtext = 'Title #tags [Area/Project] :: Notes > +DD/MM/[YY]YY'
    plist = "#{staged_path}/info.plist"
    system_command '/usr/libexec/plistbuddy', args: ['-c', 'set :name Things', plist]
    system_command '/usr/libexec/plistbuddy', args: ['-c', "set :objects:1:config:subtext #{subtext}", plist]
  end
end
