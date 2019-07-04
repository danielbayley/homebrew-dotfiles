cask 'starcraft-mass-recall' do
  version '7.1'
  sha256 '598144fe86e3aa5fb8099ae9c60445a52155fa416eca5e7eba7ec1ecfad32983'

  # media.forgecdn.net was verified as official when first introduced to the cask
  url "https://media.forgecdn.net/files/2734/228/SCMR_v#{version}.zip"
  name 'StarCraft: Mass Recall'
  homepage 'https://sc2mapster.com/projects/starcraft-mass-recall'

  depends_on macos: '>= :el_capitan'

  artifact 'Mods/SCMRassets.SC2Mod', target: "#{appdir}/StarCraft II/Mods/SCMRassets.SC2Mod"
  artifact 'Mods/SCMRcinematics.SC2Mod', target: "#{appdir}/StarCraft II/Mods/SCMRcinematics.SC2Mod"
  artifact 'Mods/SCMRlocal.SC2Mod', target: "#{appdir}/StarCraft II/Mods/SCMRlocal.SC2Mod"
  artifact 'Mods/SCMRmod.SC2Mod', target: "#{appdir}/StarCraft II/Mods/SCMRmod.SC2Mod"
  artifact 'Starcraft Mass Recall', target: "#{appdir}/StarCraft II/Maps/Starcraft Mass Recall"

  preflight do
    url = "https://media.forgecdn.net/files/2734/872/SCMR_v#{version}_Mods.zip"
    `/usr/bin/curl -L --progress-bar #{url} | /usr/bin/tar -xC #{staged_path}`

    url = "https://media.forgecdn.net/files/2730/622/SCMRcinematics_v#{version}.zip"
    `/usr/bin/curl -L --progress-bar #{url} | /usr/bin/tar -xC #{staged_path}`
  end

  uninstall rmdir: [
                     "#{appdir}/StarCraft II/Mods",
                     "#{appdir}/StarCraft II/Maps",
                   ]

  zap trash: [
               '~/Library/Application Support/Blizzard/StarCraft II/Banks/SCMR.SC2Bank',
               '~/Library/Application Support/Blizzard/StarCraft II/*/Multiplayer/Starcraft Mass Recall*.SC2*',
             ],
      rmdir: '~/Library/Application Support/Blizzard/StarCraft II/Banks'
end
