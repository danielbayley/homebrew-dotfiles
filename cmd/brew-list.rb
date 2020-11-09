# frozen_string_literal: true

require "io/console"
require "formula"

COLUMNS = IO.console.winsize.last.freeze
WIDTH = 2

TAP, = caller.to_s.scan(%r{(?<!#{__dir__})/(brew-.+?)\.rb}).flatten

module List
  def caller
    *, prefix = TAP.split "-"
    full_name =~ %r{/.*#{prefix}-}
  end

  def pretty_print
    token = TAP ? File.basename(full_name) : full_name
    puts "#{token.ljust COLUMNS / WIDTH}\t#{version}"
  end
end

class Formula
  include List

  def install_time
    File.birthtime installed_kegs.last
  end
end

module Cask
  class Cask
    include List
  end
end

case ARGV.to_s
when /--casks?/ then list = Cask::Caskroom.casks
when /-\w/
  exec "brew", "list", *ARGV
else
  list = Formula.installed
  if TAP
    list += Cask::Caskroom.casks
    list.filter!(&:caller)
  end
end

list.sort_by(&:install_time).each(&:pretty_print)
