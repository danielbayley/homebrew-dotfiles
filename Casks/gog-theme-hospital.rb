cask 'gog-theme-hospital' do
  version '1.0.3,33062'
  sha256 'c1a05fa9af8673ffcdf78842f4464a2be4d3e1475358c955e556e913eb74f0b3'

  # dropbox.com/s was verified as official when first introduced to the cask
  url "https://dropbox.com/s/tto6l7cw2qm4e97/theme_hospital_#{language}_#{version.before_comma.dots_to_underscores}_#{version.after_comma}.pkg?dl=1"
  name 'Theme Hospital'
  homepage 'https://gog.com/game/theme_hospital'

  preflight do
    Dir.chdir(staged_path) do
      pkg = File.basename CGI.unescape @cask.url.path
      system_command '/usr/sbin/pkgutil', args: args = ['--expand', pkg, 'pkg']

      Dir.chdir("#{args.last}/package.pkg/Scripts") do
        utils = Formula.ancestors.find { |a| a.name == 'Utils::Inreplace' }
        utils.inreplace 'postinstall', %r{^gog_bundle_location=.*?fi$}m, "gog_bundle_location=#{appdir}/"

        FileUtils.cp 'payload/Contents/Resources/game/manual.pdf', staged_path

        system_command './postinstall', print_stderr: false
      end
      FileUtils.rm_r args.drop 1
    end
  end

  uninstall delete: "#{appdir}/#{name.first}.app"

  zap trash: [
               '~/Library/Preferences/com.gog.theme-hospital.plist',
               '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.gog.theme-hospital.sfl*',
             ]

  caveats "Read the manual at #{staged_path}/manual.pdf"
end
