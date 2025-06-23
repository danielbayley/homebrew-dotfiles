cask "pnpm" do
  arch arm: "arm64", intel: "x64"
  os macos: "macos", linux: "linux"

  formula = Formula[token]
  version "10.12.1"
  sha256 arm:          "8b39b2129a19eeec9511eb7cdde2450b604e389551d59ad738167f7495b56d52",
         intel:        "4c78e34022bfecfae60c041148a8022858b80b50e3b31c8fa8ba7b2b6259dd4a",
         arm64_linux:  "c2f9e9d42d81f9f40a0f895513d014a08d5ecb0abc9e15c426ecfde6f492706b",
         x86_64_linux: "eb2dc1f109bca046ce734d062c8dd8f34db2b58a115992f9b086456efd7b2305"

  repo = "github.com/pnpm/pnpm"
  url "https://#{repo}/releases/download/v#{version}/pnpm-#{os}-#{arch}",
      verified: repo
  name token
  desc "#{formula.desc}, packaged with Node.js into an executable"
  homepage "https://#{URI(formula.homepage).host}"

  livecheck do
    formula "#{formula.tap.name}/pnpm"
  end

  conflicts_with formula: token

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
