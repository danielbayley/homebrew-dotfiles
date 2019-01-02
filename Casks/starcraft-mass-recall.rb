cask 'starcraft-mass-recall' do
  version '7.0'
  sha256 'b75c9cd040365c645ab69812a4dcf9f2861da206b495c4809c2b7db6e4e20545'

  # media.forgecdn.net was verified as official when first introduced to the cask
  url "https://media.forgecdn.net/files/2654/551/SCMR_v#{version}.zip"
  name 'StarCraft: Mass Recall'
  homepage 'https://sc2mapster.com/projects/starcraft-mass-recall'

  depends_on macos: '>= :el_capitan'

  artifact 'Mods/SCMRassets.SC2Mod', target: "#{appdir}/StarCraft II/Mods/SCMRassets.SC2Mod"
  artifact 'Mods/SCMRcinematics.SC2Mod', target: "#{appdir}/StarCraft II/Mods/SCMRcinematics.SC2Mod"
  artifact 'Mods/SCMRlocal.SC2Mod', target: "#{appdir}/StarCraft II/Mods/SCMRlocal.SC2Mod"
  artifact 'Mods/SCMRmod.SC2Mod', target: "#{appdir}/StarCraft II/Mods/SCMRmod.SC2Mod"
  artifact 'Starcraft Mass Recall', target: "#{appdir}/StarCraft II/Maps/Starcraft Mass Recall"

  preflight do
    # dropbox.com/s/m3bwn32gs2jrtdp was verified as official when first introduced to the cask
    url = 'https://dropbox.com/s/m3bwn32gs2jrtdp/SCMRcinematics.SC2Mod?dl=1'
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
