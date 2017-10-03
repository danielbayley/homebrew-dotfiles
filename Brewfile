# [Homebrew](http://brewformulas.org)
# [Casks](http://caskroom.io)
# [mas](https://github.com/argon/mas)
# [Product Hunt](https://producthunt.com)
# [Electron](https://electron.atom.io/apps)

#cask_args appdir: '/Applications' #, args: { appdir: '~/Applications'}
#unless File.directory?(ENV['HOME'] + '/?')

#tap 'homebrew/bundle'
#tap 'homebrew/dupes'
#brew 'cask' #brew 'caskroom/cask/brew-cask'
#tap 'caskroom/cask'
tap 'caskroom/versions'
brew 'mas'
tap 'homebrew/services'

# TODO https://github.com/caskroom/homebrew-cask/issues/29301
tap 'buo/cask-upgrade' # https://github.com/buo/homebrew-cask-upgrade

tap 'danielbayley/ery' #homebrew-ery
tap 'codeclimate/formulae'
#tap 'max-os/services' TODO macOS-Xtra/
#tap 'max-os/formulae'

#-------------------------------------------------------------------------------

# System
mas 'macOS Sierra', id: 1127487414
#mas 'macOS Server', id: 883878097
mas 'Apple Configurator 2', id: 1037126344
brew 'ansible'
#tap 'thoughtbot/formulae'
#brew 'rcm'

# VM/CI
#cask 'vagrant'
#brew 'packer'
cask 'docker' #brew
#brew 'docker-machine'
#brew 'docker-compose'
cask 'anka-run'
cask 'veertu-desktop' #mas 'veertu', id: 1024069033 #'veertu 2016 business', id: 1082458124
#brew 'qemu' #vdlaunch

# Backup
cask 'backblaze' #–downloader
#brew 'b2-tools'
#cask 'duplicati' #brew 'duplicity'
#cask 'transmit' #-disk #mas 'Transmit', id: 403388562
#cask 'megasync'
#brew 'megatools' #megacmd
#cask 'osxfuse' #expandrive #arq #cloudmounter
#cask 'mountain-duck'
#brew 'duck'

#brew 'bash'
brew 'zplug'
#tap 'molovo/revolver'
#tap 'zunit-zsh/zunit'#/zunit
#brew 'zunit'
#brew 'zsh-syntax-highlighting'
brew 'shellcheck'
brew 'duti'
brew 'pick'
brew 'cmake'
#brew 'entr'
#cask 'xquartz'
brew 'archey'

cask 'hyper' #black-screen

cask 'usb-overdrive'

#-------------------------------------------------------------------------------

cask 'hazel'
tap 'homebrew/services'
brew 'osxutils' #trash
brew 'hardlink-osx' #hardlink
brew 'coreutils' #--with-default-names
brew 'gnu-sed'
#brew 'grep' # gnu
#brew 'gawk'
#brew 'findutils'
brew 'moreutils'
cask 'symboliclinker'
#brew 'stow'
brew 'unar'

#cask 'secrets'
#cask 'controlplane'
#brew 'xdotool'
#cask 'preferencecleaner'
#cask 'magic-launch'
#cask 'rcdefaultapp'

#brew 'sidebarfinagler'
#cask 'xtrafinder' #mas 'forklift', id: 412448059 #cask 'commander-one'
#cask 'asepsis' # http://pixelcog.com/blog/2016/disable-ds_store-in-el-capitan
cask 'clusters'
cask 'daisydisk' #mas 'DaisyDisk', id: 411643860
#cask 'gemini' #mas 'Duplicate Detective', id: 686428787
#brew 'rename'
#cask 'renamer'
mas 'Mactracker', id: 430255202 #cask 'mactracker'
cask 'pacifist'
#cask 'cleanmymac' #mas 'CleanMyDrive 2', id: 523620159
#cask 'endurance'
cask 'imazing' #waltr

cask 'transmission'
brew 'transmission', restart_service: :changed # FIXME crashes hard!
#cask 'leech' #folx
cask 'resilio-sync'
#cask 'jdownloader'
#cask 'dropbox'
cask 'droplr' #mas 'Droplr', id: 498672703
mas 'CloudApp', id: 417602904 #cask 'cloudapp' #minbox #dropshare #cloudup

# Security
mas '1Password', id: 443987910 #cask #mas 'wallet', id: 404234608
brew 'onepass'
#cask 'encryptr'
brew 'gpg'
#cask 'keeweb'
#brew 'keybase'
brew 'tccutil'
#cask 'management-tools'
#cask 'privacy-services-manager'
#brew 'pass'
#mas 'Better', id: 1121192229
#brew 'torbrowser'

#
#tap 'golemfactory/golem'
#cask 'golem'

#-------------------------------------------------------------------------------

# UI/X
#cask 'lumen'
cask 'alfred' #mas 'Alfred', id: 405843582 #cask 'launchbar'
#cask 'bartender'
cask 'spectacle'
#mas 'Battery Indicator', id: 0
cask 'liteicon'
#cask 'flavours'
#cask 'candybar'
cask 'icon-tester'
#cask 'uielementinspector'
cask 'qdesktop'

brew 'tag'
#mas 'PushPal - for PushBullet', id: 909832412 #mas 'Pushbullet', id: 948415170
#cask 'notifyr'
brew 'terminal-notifier'
brew 'dockutil'
#cask 'cdock'

cask 'cheatsheet'
#cask 'functionflip'
mas 'Pastebot', id: 1179623856 #'Copied', id: 1026349850 #'Paste', id: 967805235 # https://ohsloth.com
cask 'quadrosync'
mas 'Gifox', id: 1082624744 #cask 'kap' #mas 'GIPHY CAPTURE', id: 668208984
brew 'gifsicle'
#cask 'pashua'

#brew 'grip'

# QuickLook
cask 'qlcolorcode'
cask 'qlstephen'
cask 'qlmarkdown'
cask 'qlswift'
cask 'scriptql'
#cask 'quicklook-csv'
#cask 'quicklook-json'
cask 'brushviewql'
#cask 'betterzipql'

#-------------------------------------------------------------------------------

# Email
cask 'nylas-mail' #cask 'polymail' #mas 'Airmail 3', id: 918858936 #'Spark', id: 1176895641

# Workflow
cask 'things' #mas 'Things', id: 407951449 #'Things 3'
#brew 'todo-txt'
mas 'Evernote', id: 406056744 #cask 'evernote'
#mas 'Alternote', id: 974971992
#cask 'airtable'
brew 'wakatime-cli'
#mas 'Billings Pro', id: 434514810
#cask 'money'
#cask 'bitpay'
#cask 'timing' #usage #timings
cask 'numi' #mas 'Calcbot', id: 931657367
mas 'Numbers', id: 409203825

# Reading
mas 'ReadKit', id: 588726889 #mas 'Reeder 3', id: 880001334
#cask 'winds'
mas 'Pocket', id: 568494494
cask 'raindropio'

# Social
mas 'Tweetbot', id: 557168941
cask 'franz'
#mas 'Slack', id: 803453959 #cask 'slack'
#cask 'gitter'
#cask 'chitchat'
#cask 'skype' #discord

#cask 'nteract'
#mas 'Ulysses', id: 623795237
#cask 'mou' #typora #whiskey #mas 'Bear', id: 1091189122 #cask 'caret'
brew 'proselint'
brew 'translate-shell'
#mas 'Deckset', id: 847496013
#brew 'poppler'
#mas 'meditor', id: 1065718148
#cask 'ghost'
#cask 'microsoft-office'

#-------------------------------------------------------------------------------

# Design
cask 'adobe-creative-cloud'
cask 'adobe-creative-cloud-cleaner-tool'
#cask 'adobe-illustrator-cc'
#cask 'adobe-photoshop-cc'
#cask 'adobe-indesign-cc'
#cask 'adobe-after-effects-cc'
#cask 'cuda'
#cask 'adobe-media-encoder-cc'
#cask 'adobe-premiere-pro-cc'
#cask 'zxpinstaller'
#cask 'sketch' #-toolbox #cask 'plant' TODO https://plantapp.io
#App*s/Sketch.app/*/*/sketchtool/install.sh
#mas 'Affinity Designer', id: 824171161 #cask 'vectr'
#mas 'Affinity Photo', id: 824171161

#cask 'lingo'
#cask 'noun-project'
mas 'Sip', id: 507257563 #cask 'colol' TODO http://colol.me

#cask 'folio'
#cask 'framer' #zeplin #avocode #origami #figma #principle #balsamiq-mockups
#invisionsync #craft
cask 'livesurface-context'
cask 'scenery'

#cask 'collectie' TODO # https://getcollectie.com

#cask 'wacom-bamboo-tablet'

# Typography
cask 'rightfont' #fontbase #fontstand
#mas 'Type Case', id: 994524929
#tap 'font-octicons'
#brew 'fontforge'
#tap 'caskroom/fonts' # TODO # NOTE hardlinks into ~/Library/Fonts
#cask 'font-hasklig'
#cask 'font-fira-code'
#cask 'font-hack' #caskroom/fonts/font-hack
#cask 'font-cousine'
#cask 'font-droid-sans-mono'
#cask 'font-redacted'
#cask 'font-interface'

brew 'graphicsmagick'
brew 'svg2png'
#mas 'svgsus', id: 1106867065
brew 'png2ico'
#cask 'icons'
brew 'pngcrush'
#brew 'libicns'
#brew 'gifsicle'
#cask 'xscope'

# Development
brew 'ripgrep'

# Git
#brew 'git'
brew 'git-lfs'
brew 'hub'
#brew 'git-hub' # https://github.com/Homebrew/homebrew-core/pull/TODO
#brew 'git-hooks'
#brew 'git-flow'
#brew 'git-subrepo'
#brew 'git-extras'

brew 'gist'
mas 'SnippetsLab', id: 1006087419 #mas 'Quiver', id: 866773894 #cask 'lepton'

#cask 'kaleidoscope'
cask 'ksdiff'

cask 'gitkraken' #tower #github-desktop #-beta
#cask 'deckhub'
#cask 'gitscout'
#cask 'hawk-eye'

#brew 'autoenv' #direnv
brew 'codeclimate'
#brew 'bitrise'

# IDE
cask 'atom-beta'
#cask 'sublime-text'
#cask 'coda'
#brew 'coda-cli'

# mac/iOS
mas 'Xcode', id: 497799835
cask 'alcatraz'
brew 'carthage' #cocoapods'
#brew 'swift'
#brew 'swiftlint'
#brew 'swiftgen'

# Documentation
cask 'dash'

# Frontend/web
#cask 'hammer'
#cask 'cactus'
brew 'hugo'
brew 'sassc'
brew 'discount'
#brew 'watch'

brew 'nginx'
#tap 'homebrew/apache'
#brew 'mod_?'
brew 'dnsmasq', restart_service: :changed
brew 'namebench' #cask
brew 'wget'
#cask 'insomnia'
brew 'webarchiver'

cask 'google-chrome'
cask 'firefox'
#cask 'brave'
cask 'flash-player'
cask 'silverlight'
cask 'java'

brew 'node' #npm
#brew 'coffeescript'
#brew 'brew-gem'
brew 'httpie'
brew 'pup'
brew 'jq'
brew 'remarshal'
brew 'shyaml'
brew 'tidy-html5'
brew 'pandoc'
brew 'smartypants'
brew 'csv-fix'
#brew 'xmlstarlet'

# Python
#brew 'brew-pip' #sudo easy_install pip

#-------------------------------------------------------------------------------

# Audio
cask 'ableton-live-suite' #ableton-live-beta
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
#cask 'circle-wavetable-generator'
#mas 'Audulus 3', id: 1031667826

# Video
brew 'youtube-dl'
#cask 'beardedspice'
#brew 'minidlna'
cask 'airserver'
#cask 'duet'
#cask 'vlc'
#cask 'mplayerx'
#cask 'maddthesane-perian'
#cask 'flip4mac'

# Entertainment
#cask 'webtorrent'
#tap 'asio/popcorn-time' #casidiablo/custom
cask 'popcorn-time'

# Gaming
cask 'battle-net'
#mas 'Worms Revolution', id: 616018342
#cask 'lego-digital-designer'
#mas 'Bike Baron', id: 539235808
#cask 'unity-web-player'
#### Theme Hospital
#brew 'lua'
#exec 'luarocks install lpeg' #luafilesystem
#tap 'games'
#brew 'corsixth'
#linkapps 'corsixth' #exec 'brew linkapps corsixth'
#cask 'danielbayley/theme-hospital' TODO?

#-------------------------------------------------------------------------------

#cleanup
