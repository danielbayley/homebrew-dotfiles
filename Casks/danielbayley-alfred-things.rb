cask "danielbayley-alfred-things" do
  cask, = token.partition("-").drop 2
  extend = CaskLoader.load cask

  version extend.version
  sha256 extend.sha256

  url extend.url.uri
  appcast extend.appcast.uri
  name extend.name
  desc "Create to-dos with Alfred"
  homepage extend.homepage

  conflicts_with cask: extend.token
  depends_on extend.depends_on

  artifact staged_path, target: extend.artifacts.first.target

  preflight do
    subtext = "Title #tags [Area/Project] :: Notes > +DD/MM/[YY]YY"

    plist = "#{staged_path}/info.plist"
    xml = Plist.parse_xml(plist).deep_symbolize_keys
    xml[:name] = "Things"
    xml[:objects].last[:config][:subtext] = subtext
    File.write plist, xml.to_plist
  end
end
