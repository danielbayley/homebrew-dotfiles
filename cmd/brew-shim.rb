# frozen_string_literal: true

aliases = {
  ls: "list",
  ri: "reinstall",
  rb: "ruby",
}

ARGV.map!(&->(arg) { aliases[arg.to_sym] or arg })

if ARGV.include? "cask"
  ARGV.shift
  cask = "cask"
end

command, = Dir["#{__dir__}/brew#{cask}-#{ARGV.first}{.*,}"]

if command
  ARGV.shift
  command.end_with?(".rb") ? require(command) : exec(command, *ARGV)
else
  exec "brew", *Homebrew.args.remaining
end
