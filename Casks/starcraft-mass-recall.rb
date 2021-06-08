cask "starcraft-mass-recall" do
  version "8.0.1"
  sha256 "76750def5b63cf58afeb63e9948b5efec23adb436964eb730fe5d800d5a89e3b"

  resources = {
    mod:        ["3246208", "SCMR_v#{version}.zip"],
    assets:     ["3239552", "SCMRassets_v#{version}.zip", "9277d51c89e3cc473a3b5d588c2f3cdb"],
    cinematics: ["2819339", "SCMRcinematics_v7.2.zip", "f19ea12979eb8eaf703ed00ef33b7912"],
    redux:      ["3246278", "Enslavers_Redux_v#{version}.zip", "b61129ef7df2004faa4c08480e447f31"],
  }

  language "en", default: true do
    {
      local: ["3147425", "SCMRlocal_v#{version.major_minor}_EN.zip", "1a029f3f082353859ac3979d00781628"],
    }
  end
  language "de" do
    {
      local:      ["3273584", "SCMRlocal_v#{version}_DE.zip", "74d0b9a4b392188c2421611251dd4304"],
      cinematics: ["3273570", "SCMRcinematics_v#{version}_DE.zip", "3a137c249971c863b84c388f23458e4b"],
    }
  end
  language "pl" do
    {
      local: [
        "3269534", "SCMRlocal_#{version.dots_to_underscores}_PL_SS_ENSR_1_2.zip",
        "249b1be2ff52f37de78487a4d2174d7f"
      ],
    }
  end
  language "es" do
    {
      local: [
        "3222127", "SCMR+v#{version.major_minor}+Latam+Spanish+Localization.zip",
        "ee11307e9ad8105ea3e5cd75d97e8cc1"
      ],
    }
  end
  language "ru" do
    {
      local:  ["3163569", "SCMRlocal_RUS_v#{version.major}.zip", "36e37bd9e4814bbb3b67d6aee841e85e"],
      redux:  ["3178333", "Enslavers_Redux_RUS_v#{version.major}.zip", "dfd2c54813f3e7a769f6d58043054a3f"],
      stukov: ["3178335", "Stukov_Series_RUS_v#{version.major}.zip", "2ff9f042cd73de0a57f03956e5a20bbf"],
    }
  end
  language "ko" do
    { local: ["2815486", "SCMRlocal_v7.1_KR.zip", "92f0c8b1dfc91701139b139839b5a07b"] }
  end

  cdn = "media.forgecdn.net/"
  file_url = lambda do |id, file, *|
    split = id.unpack("a4a*").join "/"
    "https://#{cdn}files/#{split}/#{file}"
  end

  url file_url[*resources.shift.last], verified: cdn
  name "StarCraft Mass Recall"
  desc "Starcraft II engine recreation of classic Starcraft and Brood War campaigns"
  homepage "https://sc2mapster.com/projects/#{token}"

  livecheck do
    url "https://starcraft.fandom.com/wiki/StarCraft:_Mass_Recall"
    strategy :page_match
    regex %r{Version</h\d>.*<div.*>(\d+(?:\.\d+)+)</div>}m
  end

  depends_on macos: ">= :el_capitan"

  suite = "#{appdir}/StarCraft II"
  artifact name.first, target: "#{suite}/Maps/#{name.first}"
  artifact "Mods/SCMRmod.SC2Mod", target: "#{suite}/Mods/SCMRmod.SC2Mod"
  artifact "Mods/SCMRassets.SC2Mod", target: "#{suite}/Mods/SCMRassets.SC2Mod"
  artifact "Mods/SCMRlocal.SC2Mod", target: "#{suite}/Mods/SCMRlocal.SC2Mod"
  artifact "Mods/SCMRcinematics.SC2Mod", target: "#{suite}/Mods/SCMRcinematics.SC2Mod"

  preflight do
    Dir.chdir(staged_path) do
      resources.merge(language).each do |*, (id, zip, md5)|
        url = file_url[id, zip]

        curl_download url, to: zip unless File.exist? zip

        actual = Digest::MD5.file zip
        raise CaskSha256MismatchError.new token, md5, actual, zip if actual != md5

        UnpackStrategy::Zip.new(zip).extract to: Dir.pwd
      end
      FileUtils.mv Dir["Extras/*"], "#{@cask.name.first}/Extras", force: true
      FileUtils.ln_sf "#{suite}/Support/SC2Switcher.app", "#{suite}/#{@cask.name.first}.app"
      FileUtils.rm Dir["*.zip"]
    end
  end

  uninstall delete: "#{suite}/#{name.first}.app", rmdir: "#{suite}/M{od,ap}s"

  application_support = "~/Library/Application Support/Blizzard/StarCraft II"
  banks = "#{application_support}/Banks"
  zap trash: [
    "#{banks}/SCMR.SC2Bank",
    "#{application_support}/*/Multiplayer/#{name.first}*.SC2*",
  ], rmdir: banks
end
