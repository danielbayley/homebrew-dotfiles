cask 'rubberhose' do
  version '2.04'
  sha256 'ff858c7fcebf13d8dfce1381bdc05a06bd6cd8665e7004fd74dac6c0916ab7c7'

  url do
    url = 'https://mega.nz/#!cPpHXTxA!4Y56N0AJ3C7QidE5mRH6MQ7fHU2T9i-ENrHCvaxZv5w'
    unpack = "#{HOMEBREW_CACHE}/Cask/rubberhose--#{version}.incomplete"
    system "#{HOMEBREW_PREFIX}/bin/megadl #{url} --path=#{unpack}"
    '--version'
  end
  name 'RubberHose'
  homepage 'http://battleaxe.co/rubberhose'

  depends_on formula: 'megatools'

  subfolder = 'Scripts/ScriptUI Panels'
  folder = "/Applications/Adobe Creative Cloud/Adobe After Effects */#{subfolder}/"
  plugin = 'RubberHose.jsxbin'

  artifact "RubberHose#{version.major}.jsxbin",
           target: Dir[folder].sort { |min, max| min <=> max }[-1] + plugin

  uninstall delete: [
                      folder + plugin,
                      "~/Library/Preferences/Adobe/After Effects/*/#{subfolder}/#{plugin}",
                    ],
            rmdir:  '~/Library/Application Support/BattleAxe'

  zap trash: "~/Library/Application Support/BattleAxe/RubberHose #{version.major}"
end
