# frozen_string_literal: true

exit 1 if ARGV.empty?

cask = Cask::CaskLoader.load ARGV.first

zap = cask.artifacts.select do |artifact|
  artifact.is_a? Cask::Artifact::Zap
end

zap.each(&:zap_phase) unless zap.empty?
