cask "vs-code" do
  extend = CaskLoader.load "vscodium"

  version extend.version
  sha256 extend.sha256.hexdigest

  url extend.url.uri
  name extend.name
  desc "#{extend.desc}, with modifications"
  homepage "https://#{extend.homepage.split("//").last}"

  auto_updates extend.auto_updates
  conflicts_with cask: extend.token

  app app = extend.artifacts.first.source.basename
  binary extend.artifacts.to_a[1].source, target: "code"

  preflight do
    path = staged_path/app/"Contents/Resources/app/product.json"
    json = JSON.load_file path
    json["extensionsGallery"] = {
      serviceUrl: "https://marketplace.visualstudio.com/_apis/public/gallery",
      itemUrl:    "https://marketplace.visualstudio.com/items",
    }
    path.write JSON.pretty_generate json
  end

  uninstall quit: name.first

  zap trash: extend.artifacts.to_a.third.directives.values.flatten
end
