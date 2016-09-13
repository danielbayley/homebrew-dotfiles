# [Homebrew](http://brewformulas.org)
# [Casks](http://caskroom.io)
## [CaskroomStore](https://caskroomstore.org)
## [mas-cli](https://github.com/argon/mas)

#cask_args appdir: '/Applications' #, args: { appdir: '~/Applications'}
#unless File.directory?(ENV['HOME'] + '/?')

#tap 'homebrew/bundle'
#tap 'homebrew/dupes'
brew 'cask' #brew 'caskroom/cask/brew-cask'
#tap 'caskroom/cask'
#tap 'caskroom/versions'
brew 'mas'
tap 'danielbayley/homebrew-ery'

#-------------------------------------------------------------------------------

## System
brew 'ansible'
#tap 'thoughtbot/formulae'
#brew 'rcm'
cask 'docker'
mas 'veertu', id: 1024069033 #'veertu 2016 business', id: 1082458124
cask 'vagrant'
brew 'packer'
#cask 'vmware-fusion'
### zsh
brew 'zplug'
#brew 'zsh-syntax-highlighting'
brew 'shellcheck'
brew 'cmake'

cask 'hyperterm' #black-screen

cask 'usb-overdrive'

#-------------------------------------------------------------------------------

cask 'hazel'
tap 'homebrew/services'
brew 'osxutils' #trash
brew 'hardlink-osx'
brew 'coreutils'
brew 'moreutils'
brew 'aliaspath'
brew 'symlinks'
#brew 'stow'
brew 'unar'

#cask 'secrets'
#cask 'preferencecleaner'
#cask 'magic-launch'
#cask 'rcdefaultapp'

cask 'xtrafinder' #mas 'forklift', id: 412448059 #cask 'commander-one'
#cask 'asepsis' # http://pixelcog.com/blog/2016/disable-ds_store-in-el-capitan
cask 'clusters'
mas 'DaisyDisk', id: 411643860 #cask 'daisydisk'
#cask 'gemini' #mas 'Duplicate Detective', id: 686428787
#cask 'renamer' FIXME
mas 'Mactracker', id: 430255202 #cask 'mactracker'
cask 'pacifist'
#cask 'cleanmymac' #mas 'CleanMyDrive 2', id: 523620159
#cask 'endurance'
cask 'imazing'

cask 'transmission'
brew 'transmission', restart_service: :changed
cask 'bittorrent-sync'
#cask 'jdownloader'
#cask 'dropbox'
mas 'CloudApp', id: 417602904 #cask 'cloud' #cask 'cloudup'
#cask 'minbox'

## Security
mas '1Password', id: 443987910 #cask #mas 'wallet', id: 404234608
#cask 'encryptr'
brew 'gpg'
#cask 'keeweb'
#brew 'keybase'
cask 'keytouch'
brew 'tccutil'
#cask 'management-tools'
#cask 'privacy-services-manager'
#brew 'pass'
#brew 'tor'

#-------------------------------------------------------------------------------

## UI/X
#cask 'lumen'
cask 'bartender'
#cask 'alfred' #mas 'Alfred', id: 405843582 #cask 'launchbar'
cask 'liteicon'
#cask 'flavours'
#cask 'candybar'
cask 'icon-tester'
cask 'qdesktop'

brew 'tag'
#mas 'PushPal - for PushBullet', id: 909832412 #mas 'Pushbullet', id: 948415170
brew 'terminal-notifier'
brew 'dockutil'

cask 'cheatsheet'
#cask 'functionflip'
#mas 'Copied', id: 1026349850 #cask 'pastebot' TODO
cask 'quadrosync'
mas 'GIPHY CAPTURE', id: 668208984
#cask 'pashua'

## QuickLook
cask 'qlcolorcode'
cask 'qlstephen'
cask 'qlmarkdown'
cask 'scriptql'
#cask 'quicklook-csv'
#cask 'quicklook-json'
cask 'brushviewql'
#cask 'betterzipql'

#-------------------------------------------------------------------------------

## Email
cask 'nylas-n1' #cask 'polymail' FIXME #mas 'Airmail 3', id: 918858936

## Workflow
cask 'things'
mas 'Evernote', id: 406056744 #cask 'evernote'
#mas 'Alternote', id: 974971992
brew 'wakatime-cli'
#mas 'Billings Pro', id: 434514810
#cask 'money'
#mas 'Timing', id: 431511738 #cask 'timing'
mas 'Calcbot', id: 931657367 #cask 'numi'
mas 'Numbers', id: 409203825

## News
mas 'ReadKit', id: 588726889 #mas 'Reeder 3', id: 880001334
mas 'Pocket', id: 568494494

## Social
mas 'Tweetbot', id: 557168941
cask 'franz'
#mas 'Slack', id: 803453959 #cask 'slack'
#cask 'gitter'
#cask 'chitchat'
#cask 'skype' #discord

#cask 'mou' #typora #whiskey
#mas 'Deckset', id: 847496013
#mas 'meditor', id: 1065718148
#cask 'ghost'
#cask 'microsoft-office'

#-------------------------------------------------------------------------------

## Design
cask 'adobe-creative-cloud'
cask 'adobe-creative-cloud-cleaner-tool'
#cask 'adobe-illustrator-cc'#-gb
#cask 'adobe-photoshop-cc'#-gb
#cask 'adobe-indesign-cc'#-gb
#cask 'adobe-after-effects-cc' TODO -gb
#cask 'adobe-media-encoder-cc' TODO -gb
#cask 'adobe-premiere-pro-cc' TODO -gb

#cask 'lingo'
#cask 'noun-project'
#cask 'pixelapse'
mas 'Sip', id: 507257563

#cask 'sketch' #vectr
#cask 'sketch-toolbox'
#cask 'sketch-tool' #App*s/Sketch.app/*/*/sketchtool/install.sh

cask 'zeplin'
cask 'framer'
#cask 'invisionsync' #craft TODO?
#cask 'adobe-experience-design-cc' TODO?
#cask 'origami'
#cask 'balsamiq-mockups'
#cask 'principle' #pixate-studio
cask 'livesurface-context'
cask 'scenery'

#cask 'wacom-bamboo-tablet'

### Typography
cask 'rightfont'
#cask 'fontstand'
cask 'woff2sfnt-sfnt2woff' #sfnt2woff TODO
#tap 'font-octicons'
#brew 'fontforge'
#tap 'caskroom/fonts' # TODO # NOTE hardlinks into ~/Library/Fonts
#cask 'font-hasklig'
#cask 'font-fira-code'
#cask 'font-hack' #caskroom/fonts/font-hack
#cask 'font-cousine'
#cask 'font-droid-sans-mono'

brew 'graphicsmagick'
brew 'svg2png'
#mas 'svgsus', id: 1106867065
brew 'png2ico'
#cask 'icons'
brew 'pngcrush'
#brew 'libicns'
#brew 'gifsicle'
#cask 'xscope'

## Development
brew 'git' # TODO until git-lfs is native on macOS
#brew 'gitsh'
brew 'hub'
brew 'git-lfs'
brew 'git-extras'
#cask 'kaleidoscope'
cask 'ksdiff'
cask 'gitkraken' #github-desktop
#cask 'tower'
#cask 'deckhub'
brew 'gist'

## IDE
cask 'atom'
cask 'coda'
brew 'coda-cli'
mas 'Xcode', id: 497799835
cask 'alcatraz'
#mas 'Hammer', id: 548600167
#cask 'cactus'
#cask 'mixture'
mas 'SnippetsLab', id: 1006087419 #mas 'Quiver', id: 866773894
mas 'Dash', id: 449589707
#cask 'avocode'

## mac/iOS
#brew 'swift'
brew 'cocoapods'
#brew 'swiftgen'

## Web
brew 'hugo'
brew 'sassc'
brew 'discount'
#brew 'watch'

brew 'nginx'
#tap 'homebrew/apache' TODO
#brew 'mod_?'
brew 'dnsmasq', restart_service: :changed
brew 'namebench' #cask
brew 'wget'
brew 'webarchiver'

cask 'google-chrome'
cask 'firefox'
#cask 'brave'
cask 'flash'
cask 'silverlight'
cask 'java'

brew 'node'
#brew 'npm'
brew 'jq'
brew 'tidy-html5'
brew 'pandoc'
brew 'smartypants'
brew 'csv-fix'
#brew 'xmlstarlet'

## Python
#brew 'brew-pip' #sudo easy_install pip

#-------------------------------------------------------------------------------

## Audio
tap 'caskroom/versions'
cask 'ableton-live-suite'
cask 'mixed-in-key'
cask 'cycling74-max'
cask 'stemcreator'
cask 'touchosc-editor'
cask 'touchosc-bridge'
cask 'splice'
#cask 'soundcleod'
#cask 'spotify'

cask 'subler'
cask 'sublercli'
mas 'Squeed', id: 1055310524 #cask 'the-tagger'
brew 'ffmpeg' #--with-theora --with-libvorbis #mas 'Permute 2', id: 731738567
brew 'flac'
#brew 'cuetools'
#brew 'shntool'
brew 'exiftool'
#cask 'beatport-pro'
#cask 'soundflower'
#cask 'faw-circle'

## Video
cask 'beardedspice'
brew 'minidlna'
cask 'airserver'
#cask 'duet'
#cask 'vlc'
#cask 'mplayerx'
#cask 'maddthesane-perian'
#cask 'flip4mac'

## Entertainment
cask 'webtorrent'
#tap 'asio/popcorn-time' #casidiablo/custom
cask 'popcorn-time'

### Gaming
cask 'battle-net'
#mas 'Worms Revolution', id: 616018342
#cask 'lego-digital-designer'
#cask 'unity-web-player'

#-------------------------------------------------------------------------------

#cleanup
