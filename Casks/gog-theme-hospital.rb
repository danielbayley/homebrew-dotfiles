cask "gog-theme-hospital" do
  version "1.0.3,33062"
  sha256 "c1a05fa9af8673ffcdf78842f4464a2be4d3e1475358c955e556e913eb74f0b3"

  language("en", default: true) { "enUS" }

  version_full = version.tr ".,", "_"

  share = "dropbox.com/s/tto6l7cw2qm4e97/"
  url "https://#{share}theme_hospital_#{language}_#{version_full}.pkg?dl=1", verified: share
  name "Theme Hospital"
  desc "Hospital simulator"
  homepage "https://gog.com/game/theme_hospital"

  preflight do
    Dir.chdir(staged_path) do
      pkg = File.basename CGI.unescape @cask.url.path
      system_command "/usr/sbin/pkgutil", args: args = ["--expand", pkg, "pkg"]

      Dir.chdir("#{args.last}/package.pkg/Scripts") do
        utils = Formula.ancestors.find { |ancestor| ancestor.name == "Utils::Inreplace" }
        utils.inreplace "postinstall", /^gog_bundle_location=.*?fi$/m, "gog_bundle_location=#{appdir}/"

        FileUtils.cp "payload/Contents/Resources/game/manual.pdf", staged_path

        system_command "./postinstall", print_stderr: false
      end
      FileUtils.rm_r args.drop 1
    end
  end

  uninstall delete: "#{appdir}/#{name.first}.app"

  bundle_id = "com.gog.theme-hospital"
  zap trash: [
    "~/Library/Preferences/#{bundle_id}.plist",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/#{bundle_id}.sfl*",
  ]

  caveats "Read the manual at:\n  #{staged_path}/manual.pdf"
end
