# frozen_string_literal: true

module Homebrew
  module_function

  def stanza_args
    Homebrew::CLI::Parser.new do
      description <<~EOS
        Given a <stanza> and a cask token, returns the current stanza for a given Cask. If no cask token is given, then data for all Casks is returned.
      EOS
      named_args [:stanza, :cask], min: 1
    end
  end

  def stanza
    args = stanza_args.parse
    stanza, *tokens = args.named

    tokens = Cask::Caskroom.casks.map(&:token) if tokens.empty?

    tokens.each do |token|
      begin
        cask = Cask::CaskLoader.load token
      rescue
        raise "Cask '#{token}' was not found"
      end

      data = begin
        cask.send stanza
      rescue
        cask.artifacts.to_a.select do |set|
          set.class.to_s.demodulize.downcase == stanza
        end
      end

      raise "No such stanza '#{stanza}' on Cask '#{token}'" if data.blank?

      case data.class.to_s.demodulize
      when "SortedSet", "Livecheck" then pp data
      when String, Pathname, URL then puts data
      else
        puts `#{HOMEBREW_BREW_FILE} cat #{token} | grep #{stanza}`
      end
    end
  end
end
