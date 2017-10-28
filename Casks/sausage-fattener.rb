cask 'sausage-fattener' do
  version '1.0'
  sha256 '350ffbe012067b54ecd789beb0d227fa7bba0c6fb73e7a7b444bf0d19fc8d31d'

  # newsoundpresets-6zztmn4hdoeg.netdna-ssl.com/wp-content was verified as official when first introduced to the cask
  url 'https://newsoundpresets-6zztmn4hdoeg.netdna-ssl.com/wp-content/uploads/2017/03/Dada-Life-Sausage-Fattener-Win-MAC.zip'
  name 'Sausage Fattener'
  homepage 'http://dadalife.com/sausage-fattener'

  container nested: "Dada.Life.Sausage.Fattener.v#{version}.VST.AU.MAC.OSX.UB-DMG/Dada.Life.Sausage.Fattener.v#{version}.VST.AU.MAC.OSX.UB.dmg"

  pkg 'Sausage-Fattener-Installer.pkg'

  postflight do
    system_command 'mkdir', args: ['-p', '/Library/Application Support/WIVI'], sudo: true
  end

  uninstall pkgutil: 'com.tailorednoise.SausageFattenerInstaller'
end
