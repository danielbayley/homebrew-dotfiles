cask "corsixth" do
  version "0.64"
  sha256 "47c0811b08123e3ba46dfb15ffebab627057645bf393b53be7ff7daeefc85c9f"

  url "https://github.com/CorsixTH/CorsixTH/releases/download/v#{version}/CorsixTH.#{version}-1.dmg"
  appcast "https://github.com/CorsixTH/CorsixTH/releases.atom"
  name "CorsixTH"
  desc "Reimplementation of the 1997 Bullfrog business sim Theme Hospital"
  homepage "https://github.com/CorsixTH/CorsixTH#readme"

  depends_on cask: th_token = "gog-theme-hospital"

  app app = "#{name.first}.app"

  preflight do
    Dir.chdir(staged_path) do
      th = Pathname.new CaskLoader.load(th_token).artifacts.to_a[1].directives[:delete]
      th_root, = Dir["#{staged_path.parent.parent}/#{th_token}/*"]
      FileUtils.mv th, th_root, force: true
      th_app = "#{th_root}/#{th.basename}"

      FileUtils.cp "#{th_app}/Contents/Resources/app.icns", "#{app}/Contents/Resources/Icon.icns"

      config = ENV["HOMEBREW_XDG_CONFIG_HOME"] ||= "#{Dir.home}/.config"
      config += "/#{@cask.name.first}"

      data = if Dir.exist? config then "#{config}/config.txt"
             else "#{app}/Contents/Resources/Lua/config_finder.lua"
             end
      utils = Formula.ancestors.find { |a| a.name == "Utils::Inreplace" }
      utils.inreplace data, %r{(theme_hospital_install\s*=\s*)\[\[.*\]\]},
                      "\\1[[#{th_app}/Contents/Resources/game]]"

      break unless Dir.exist? saves = "#{config}/Saves"

      FileUtils.cp Dir["#{th_app}/Contents/Resources/game/SAVE/*"], saves
    end
  end

  zap trash: "~/Library/Application Support/CrashReporter/#{name.first}_*.plist"
end
