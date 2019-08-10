cask 'alfred-things' do
  version '3,2017.05'
  sha256 '508ffea9bfb2f2ebb3e0c29b570ac9d71c5de8991aaf6bf97660e3fdff15cb98'

  url "https://culturedcode.com/frozen/#{version.after_comma.major}/#{version.after_comma.minor}/Add-To-Do-to-Things-#{version.major}.alfredworkflow.zip"
  name 'Things'
  homepage 'https://support.culturedcode.com/customer/en/portal/articles/2803574-creating-to-dos-with-a-launcher'

  depends_on cask: 'alfred'

  plist = Dir["#{ENV['HOME']}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist.first} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/" + name[0]

  artifact staged_path, target: workflow

  postflight do
    subtext = 'Title #tags [Area/Project] :: Notes > +DD/MM/[YY]YY'
    plist = "#{workflow}/info.plist"
    system_command '/usr/libexec/plistbuddy', args: ['-c', 'set :name Things', plist]
    system_command '/usr/libexec/plistbuddy', args: ['-c', "set :objects:1:config:subtext #{subtext}", plist]
  end
end
