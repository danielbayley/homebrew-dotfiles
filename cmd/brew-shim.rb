# frozen_string_literal: true

aliases = {
  ls: "list",
  i:  "install",
  rm: "uninstall",
  ri: "reinstall",
  rb: "ruby",
}

ARGV.map!(&->(arg) { aliases[arg.to_sym] || arg })

if ARGV.include? "cask"
  ARGV.shift
  cask = "cask"
end

command, = Dir["#{__dir__}/brew#{cask}-#{ARGV.first}{.*,}"]

if command
  ARGV.shift
  command.end_with?(".rb") ? require(command) : exec(command, *ARGV)
else
  exec HOMEBREW_BREW_FILE, *[cask, *ARGV].compact
end
