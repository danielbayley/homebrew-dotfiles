cask "pnpm" do
  arch arm: "arm64", intel: "x64"
  os macos: "macos", linux: "linux"

  formula = Formula[token]
  version "10.31.0"
  sha256 arm:          "6f2a7f51faa0bbee013fcad9be2f0d503e3a77d872c8f9551866285c64b98cd2",
         intel:        "1e8e40e0c127248300975ffc50de9d7d49fade78b55240cab1db02a9324f65d6",
         arm64_linux:  "5e8f5b3fc8fc00963686a8502ddf5882681b29dcfe392671336b660f78127152",
         x86_64_linux: "21f99c8eb302967af820ce575a48717d017203269916f932e34f5ff86334008d"

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
