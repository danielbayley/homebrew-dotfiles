.files
======
Personal macOS configuration and _[Homebrew] [tap]_.

* [Formula]e
* [_Cask_]s
* _[Brewfile]_ including _[mas]_<sup>*</sup> apps

\* [Mac App Store]

Install
-------
~~~ sh
brew tap $GITHUB_USER/dotfiles
brew --repository $_ | read
launchctl setenv ZDOTDIR $REPLY
brew bundle
~~~
`git config core.hooksPath .github/hooks`

License
-------
[MIT] © [Daniel Bayley]

[MIT]:              LICENSE.md
[Daniel Bayley]:    https://github.com/danielbayley

[homebrew]:         https://brew.sh
[tap]:              https://docs.brew.sh/Taps
[formula]:          https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md#formula-cookbook
[_cask_]:           https://github.com/Homebrew/homebrew-cask#homebrew-cask
[mas]:              https://github.com/mas-cli/mas#readme
[Mac App Store]:    https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewGrouping?id=&mt=12&ls=1
[brewfile]:         https://github.com/Homebrew/homebrew-bundle#usage

[dotfiles]:         https://github.com/danielbayley/dotfiles
