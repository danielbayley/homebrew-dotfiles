# frozen_string_literal: true

aliases = {
  help: "--help",
  ls:   "list",
  i:    "install",
  rm:   "uninstall",
  ri:   "reinstall",
  rb:   "ruby",
}

ARGV.map!(&->(arg) { aliases[arg.to_sym] || arg })

commands = Commands.internal_commands + Commands.internal_developer_commands

command, = Dir["#{__dir__}/{,brew-}#{ARGV.first}{.*,}"]

if command && commands.include?(ARGV.first)

  if command.end_with? ".rb"
    require command
    Homebrew.send ARGV.shift
  else
    exec command, *ARGV.drop(1)
  end
else
  exec HOMEBREW_BREW_FILE, *ARGV
end
