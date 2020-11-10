# frozen_string_literal: true

exec "brew", *Homebrew.args.remaining unless ARGV.shift == "dump"

options = ARGV.getopts "f", "file:", "force", "describe", "no_restart"
options.symbolize_keys!

require "#{HOMEBREW_LIBRARY}/Taps/homebrew/homebrew-bundle/lib/bundle"

dump = Bundle::Dumper.build_brewfile(options.drop(3).to_h).lines

pattern = /\s+(?!id)([a-z_]+:|if|unless)/

brewfile = options[:file] || Bundle::Dumper.brewfile_path
committed = File.readlines(brewfile).grep pattern unless brewfile == "-"

committed&.each { |line| dump.unshift line if line.include? "cask_args" }

dump.map! do |line|
  case match = committed&.find { |diff| diff.include? line.chomp }
  when nil then line
  when /restart_service:/ then options[:no_restart] ? line : match
  else match
  end
end

if brewfile == "-"
  puts dump.join unless dump.empty?
  return
elsif File.file? brewfile
  raise "#{brewfile} already exists" unless options.fetch_values(:f, :force).any?
end

File.write brewfile, dump.join
