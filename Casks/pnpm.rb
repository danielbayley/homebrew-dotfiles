cask "pnpm" do
  arch arm: "arm64", intel: "x64"
  os macos: "macos", linux: "linux"

  formula = Formula[token]
  version "10.34.5"
  sha256 arm:          "888389e8dd5ed45279043c1d3383c0942a8248b3d29ce614b302f468191f7659",
         intel:        "4deaaaf1c0246fc4230f6450959f932dbc2abfd2686f8515dabf97b0717cb9b1",
         arm64_linux:  "22391362c31edf522fd698d0b43d38fe9228e28d5b5e32124ffd0038fb60f9f0",
         x86_64_linux: "69a535476f407fb0f64427913c2b592ca2ed6bf93f92e2cb82a32349e31f36eb"

  repo = "github.com/#{token}/#{token}"
  url "https://#{repo}/releases/download/v#{version}/#{token}-#{os}-#{arch}",
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

  preflight do
    staged_path.cd do
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
