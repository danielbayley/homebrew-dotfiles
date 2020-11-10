cask "danielbayley-alfred-things" do
  version "3,2017.05"
  sha256 "508ffea9bfb2f2ebb3e0c29b570ac9d71c5de8991aaf6bf97660e3fdff15cb98"

  url "https://culturedcode.com/frozen/#{version.after_comma.major}/#{version.after_comma.minor}/Add-To-Do-to-Things-#{version.major}.alfredworkflow.zip"
  appcast "https://culturedcode.com/things/support/articles/2803574"
  name "Add To-Do to Things #{version.major}"
  desc "Create to-dos with Alfred"
  homepage "https://culturedcode.com/things/support/articles/2803574"

  depends_on cask: "alfred"

  artifact staged_path, target: "#{ENV["HOMEBREW_ALFRED_WORKFLOW_PREFIX"]}.#{token}"

  preflight do
    subtext = "Title #tags [Area/Project] :: Notes > +DD/MM/[YY]YY"

    plist = "#{staged_path}/info.plist"
    xml = Plist.parse_xml(plist).deep_symbolize_keys
    xml[:name] = "Things"
    xml[:objects].last[:config][:subtext] = subtext
    File.write plist, xml.to_plist
  end
end
