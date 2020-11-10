# frozen_string_literal: true

require "io/console"
COLUMNS = IO.console.winsize.last.freeze
WIDTH = 4

class Array
  def pretty_print
    puts "#{first.ljust COLUMNS / WIDTH}\t#{last}"
  end
end

ENV.each(&:pretty_print)
