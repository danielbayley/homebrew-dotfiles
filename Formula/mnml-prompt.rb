class MnmlPrompt < Formula
  desc "Personal Zsh configuration"
  homepage "https://github.com/#{__dir__.split("/")[6]}/mnml-prompt"
  url "#{homepage}/trunk", using: :svn
  version "1.0.0"
  license "MIT"
  head homepage

  bottle :unneeded

  def install
    theme = "mnml"
    doc.install Dir["*.md"]
    zsh_prompt = "$0() {\n"
    zsh_prompt += File.read "#{theme}.zsh"
    zsh_prompt += "}\n$0\n\n"

    zsh_prompt += "prompt_#{theme}_preview() {\n"
    zsh_prompt += File.read "preview.zsh"
    zsh_prompt += "}\n\n"

    zsh_prompt += "prompt_#{theme}_help() cat #{doc}/README.md"

    (zsh_function/"prompt_#{theme}_setup").write zsh_prompt
  end

  def caveats
    <<~EOS
      To activate mnml, add the following to your .zshrc:
        autoload -U promptinit
        promptinit
        prompt mnml
    EOS
  end

  test do
    ENV["ZSH_PROMPT_SYMBOL"] = "->"
    prompt = "autoload -U promptinit; promptinit && prompt -p mnml"
    assert_match ENV["ZSH_PROMPT_SYMBOL"], shell_output("zsh -c '#{prompt}'")
  end
end
