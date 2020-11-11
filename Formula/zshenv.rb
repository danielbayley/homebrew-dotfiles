class Zshenv < Formula
  ENV["GITHUB_REPOSITORY"] ||= __dir__[%r{.+/(.+/.+)/}, 1]

  desc "Ensure Zsh inherits the intended environment on macOS"
  homepage "https://github.com/#{ENV["GITHUB_REPOSITORY"]}"
  url "#{homepage}/archive/v0.0.1.tar.gz"

  ZDOTDIR = "#{File.dirname __dir__}/zsh".freeze

  def install
    doc.install Dir["*.md"]
  end

  plist_options startup: true

  def plist
    {
      Label:            plist_name,
      ProgramArguments: [ENV["SHELL"], "-c", "launchctl setenv ZDOTDIR #{ZDOTDIR}"],
      RunAtLoad:        true,
      WatchPaths:       ["#{ZDOTDIR}/.zshenv"],
    }.to_plist
  end

  test do
    stdout = shell_output "#{HOMEBREW_PREFIX}/bin/brew services list"
    assert_include stdout, name
  end
end
