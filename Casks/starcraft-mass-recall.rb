cask "starcraft-mass-recall" do
  version "7.3.1"
  sha256 "473a086aa3eccc1e86e300ef1f4ebc8381fb4090e7fa2e2da1945d9299279eff"

  language "en", default: true do
    [
      ["2857/297/SCMRlocal_v#{version.major_minor}", "17c3dcf94fd69c1482a454626448a023"],
      ["2819/339/SCMRcinematics_v#{version.major}.2", "f19ea12979eb8eaf703ed00ef33b7912"],
    ]
  end
  language "de" do
    [
      ["2748/113/SCMRlocal_v#{version.major}.1_DE", "c18f1bef103d861d4fe93219ec736850"],
      ["2748/960/SCMRcinematics_v#{version.major}.1_DE", "ec1286ba8c03701663b7f5fbac3ad7d5"],
    ]
  end
  language "ru" do
    ["2866/453/SCMRlocal+v#{version.major_minor}+(Russian)", "b8efce71c59badad2fa0d336dce1d11b"]
  end
  language "ko" do
    ["2815/486/SCMRlocal_v#{version.major}.1_KR", "92f0c8b1dfc91701139b139839b5a07b"]
  end
  language "pl" do
    [
      "2882/341/SCMRlocal_#{version.major_minor.dots_to_underscores}_PL_v_1",
      "aa11225e6ed00a5012393ba22d7bf3d0",
    ]
  end

  domain = "media.forgecdn.net/"
  url "https://#{domain}files/2931/253/SCMR_v#{version}.zip", verified: domain
  appcast "https://raw.githubusercontent.com/abrahamYG/sc2-campaign-sources/master/sources/#{token}.json",
          must_contain: "v#{version.major_minor}"
  name "StarCraft Mass Recall"
  desc "Starcraft II engine recreation of classic Starcraft and Brood War campaigns"
  homepage "https://sc2mapster.com/projects/#{token}"

  depends_on macos: ">= :el_capitan"

  suite = "#{appdir}/StarCraft II"
  artifact name.first, target: "#{suite}/Maps/#{name.first}"
  artifact "Mods/SCMRassets.SC2Mod", target: "#{suite}/Mods/SCMRassets.SC2Mod"
  artifact "Mods/SCMRlocal.SC2Mod", target: "#{suite}/Mods/SCMRlocal.SC2Mod"
  artifact "Mods/SCMRcinematics.SC2Mod", target: "#{suite}/Mods/SCMRcinematics.SC2Mod"
  artifact "Mods/SCMRmod.SC2Mod", target: "#{suite}/Mods/SCMRmod.SC2Mod"

  preflight do
    resources = [
      "https://edge.forgecdn.net/files/2857/290/SCMRassets_v#{version.major_minor}.zip",
      "5690c24797e1d8778654950272bf641a",
      *language.map { |path, checksum| ["https://edge.forgecdn.net/files/#{path}.zip", checksum] }.flatten,
      "https://edge.forgecdn.net/files/2857/320/SCMREnslaversRedux_v#{version.major_minor}.zip",
      "ed9761c20c581fa6d9412ffe86fb460d",
    ]

    Dir.chdir(staged_path) do
      Hash[*resources].each do |url, checksum|
        zip = File.basename CGI.unescape URI.parse(url).path

        curl_download url, to: zip unless File.exist? zip

        actual = Digest::MD5.file zip
        raise CaskSha256MismatchError.new token, checksum, actual, zip if actual != checksum

        UnpackStrategy::Zip.new(zip).extract to: Dir.pwd
      end
      FileUtils.mv "Extras/8. Enslavers Redux", "#{@cask.name.first}/Extras/8. Enslavers Redux"
      FileUtils.ln_s "#{suite}/Support/SC2Switcher.app", "#{suite}/#{@cask.name.first}.app"
      FileUtils.rm Dir["*.zip"]
    end
  end

  uninstall delete: "#{suite}/#{name.first}.app", rmdir: "#{suite}/M{od,ap}s"

  application_support = "~/Library/Application Support/Blizzard/StarCraft II"
  banks = "#{application_support}/Banks"
  zap trash: [
    "#{banks}/SCMR.SC2Bank",
    "#{application_support}/*/Multiplayer/#{name.first}*.SC2*",
  ],
      rmdir: banks
end
