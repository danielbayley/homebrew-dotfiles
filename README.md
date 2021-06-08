[<img src="logo.svg" width="35%">][.files]
==========================================
Personal _[dotfiles]_, macOS configuration and _[Home`brew`]_ [`tap`].

* [_Formula_]e
* [_Cask_]s
* _[Brewfile]_ including _[`mas`]_<sup>*</sup> apps
* [`ZDOTDIR`]
* [`git`config]
* [`npm` config]
* _[Visual Studio Code]_ [config]

\* [Mac App Store]

Install
-------
~~~ sh
brew tap $GITHUB_USER/dotfiles
brew --repository $_ | read
brew bundle install --file $REPLY/Brewfile
~~~
`git config core.hooksPath .github/hooks`

License
-------
[MIT] © [Daniel Bayley]

[MIT]:                LICENSE.md
[Daniel Bayley]:      https://github.com/danielbayley

[dotfiles]:           https://dotfiles.github.io
[.files]:             https://github.com/stars/danielbayley/lists/files
[`ZDOTDIR`]:          https://github.com/danielbayley/zdotdir#readme
[`git`config]:        https://github.com/danielbayley/gh-git#readme
[`npm` config]:       https://docs.npmjs.com/cli/using-npm/config
[Visual Studio Code]: https://code.visualstudio.com
[config]:             https://github.com/danielbayley/vscode-config#readme

[home`brew`]:         https://brew.sh
[`tap`]:              https://docs.brew.sh/Taps
[_formula_]:          https://docs.brew.sh/Formula-Cookbook
[_cask_]:             https://docs.brew.sh/Cask-Cookbook
[`mas`]:              https://github.com/mas-cli/mas#readme
[Mac App Store]:      https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewGrouping?id=&mt=12&ls=1
[brewfile]:           https://github.com/Homebrew/homebrew-bundle#usage
