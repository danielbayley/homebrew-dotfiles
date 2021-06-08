class Zdotdir < Formula
  desc "Personal Zsh configuration"
  homepage "https://github.com/#{__dir__.split("/")[6]}/#{name.demodulize.downcase}"
  url "#{homepage}/trunk", using: :svn
  version "latest"
  license "MIT"
  head homepage

  bottle :unneeded

  def install
    doc.install Dir["*.md"]
    prefix.install Dir[".z*", "*/"]
  end

  plist_options startup: true

  def plist
    {
      Label:            plist_name,
      ProgramArguments: [
        ENV["SHELL"], "-c",
        "launchctl setenv #{name.demodulize.upcase} #{opt_prefix}"
      ],
      RunAtLoad:        true,
      WatchPaths:       ["#{opt_prefix}/.zshenv", "#{opt_prefix}/.zshenv.zwc"],
    }.to_plist
  end

  test do
    ENV["ZDOTDIR"] = opt_prefix
    sourced = shell_output "/bin/zsh --source-trace -c exec 2>&1"
    assert_match "#{opt_prefix}/.zshenv", sourced
  end
end
