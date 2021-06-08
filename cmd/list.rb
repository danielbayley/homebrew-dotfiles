# frozen_string_literal: true

require "io/console"
require "formula"

COLUMNS = IO.console.winsize.last.freeze

width = 70 # %
LS_COLWIDTHS, = ENV["HOMEBREW_LS_COLWIDTHS"]&.split ":"
INDENT = (LS_COLWIDTHS || COLUMNS / 100.0 * width).to_i.freeze

FORMULAE = Formula.installed.freeze
CASKS = Cask::Caskroom.casks.freeze

module List
  def pretty_print
    puts "#{full_name.ljust INDENT}\t#{version}"
  end
end

def ls(subset)
  subset.sort_by(&:install_time).each(&:pretty_print)
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

module Homebrew
  module_function

  def list_args
    Homebrew::CLI::Parser.new do
      description <<~EOS
        List all installed formulae and casks.

        If <formula> is provided, summarise the paths within its current keg.
        If <cask> is provided, list its artifacts.
      EOS

      switch "--formula", "--formulae",
             description: "List only formulae, or treat all named arguments as formulae."
      switch "--cask", "--casks",
             description: "List only casks, or treat all named arguments as casks."

      flag "--tap=", description: "List only formulae and casks from a specific tap."

      switch "--full-name", "--versions", "--multiple", "--pinned", "-1", "-l", "-r", "-t",
             description: "Defer to native `brew` `list` command."

      named_args [:installed_formula, :installed_cask]
    end
  end

  def list
    args = list_args.parse
    if args.l? || args.named.any?
      exec HOMEBREW_BREW_FILE, "list", *ARGV
    elsif args.tap
      (FORMULAE + CASKS).sort_by(&:install_time).each do |formula|
        puts "#{formula.token.ljust INDENT}\t#{formula.version}" if formula.tap&.name == args.tap
      end
    elsif args.formula? then ls FORMULAE
    elsif args.cask?    then ls CASKS
    else
      ohai "Formulae"
      ls FORMULAE
      puts
      ohai "Casks"
      ls CASKS
    end
  end
end
