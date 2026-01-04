cask "pnpm" do
  arch arm: "arm64", intel: "x64"
  os macos: "macos", linux: "linux"

  formula = Formula[token]
  version "10.27.0"
  sha256 arm:          "60a6e7b61a5ce34ce8c34e65bdcc0979a254362ff4ab73254fbcd3982de49da1",
         intel:        "4e44fd0a841ab98f76ee73c9953cffc5ca560b2651dc9c4ebef4ecbe43a605cc",
         arm64_linux:  "61bdf073cd95154c0fbab6349dcf8a77e5e4c159854363f21722756e3ba08a9f",
         x86_64_linux: "0bbea51c4fe9dc0b5b94f147a2b7441fba3a75fe54f03a317149d738408e0496"

  repo = "github.com/pnpm/pnpm"
  url "https://#{repo}/releases/download/v#{version}/pnpm-#{os}-#{arch}",
      verified: repo
  name token
  desc "#{formula.desc}, packaged with Node.js into an executable"
  homepage "https://#{URI(formula.homepage).host}"

  livecheck do
    formula "#{formula.tap.name}/pnpm"
  end

  pnpm_home = ENV.fetch "HOMEBREW_PNPM_HOME", "#{Dir.home}/Library/pnpm"
  pnpm = File.basename url.uri.path

  binary pnpm, target: token
  binary "pnpx"
  bash_completion "pnpm.bash"
  fish_completion "pnpm.fish"
  zsh_completion  "pnpm.zsh"

  # https://pnpm.io/completion
  preflight do
    staged_path.cd do
      script = %w[bash fish zsh].map do |shell|
        "./#{pnpm} completion #{shell} > pnpm.#{shell}\n"
      end
      set_permissions pnpm, "u+x"
      system script.join

      # https://pnpm.io/cli/dlx
      File.write "pnpx", <<~EOS
        #!/bin/sh
        exec #{HOMEBREW_PREFIX}/bin/pnpm dlx "$@"
      EOS
    end
  end

  # https://pnpm.io/uninstall
  zap trash: %W[
        #{pnpm_home}/store/v#{version.major}
        ~/.pnpm-state
        ~/Library/*/pnpm
      ],
      rmdir: pnpm_home

  caveats do
    path_environment_variable pnpm_home
  end
end
