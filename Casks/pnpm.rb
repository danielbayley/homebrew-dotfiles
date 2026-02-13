cask "pnpm" do
  arch arm: "arm64", intel: "x64"
  os macos: "macos", linux: "linux"

  formula = Formula[token]
  version "10.29.3"
  sha256 arm:          "a248c56b0ab20443e18d0c8ee3207c6c564ee342bd3fc8694b3569a060cecece",
         intel:        "569877025e8894d88b1756fdbc0675330dfcd9c01ece4ab26685baafffa8e303",
         arm64_linux:  "ae70208882b2c5229e143de2454fc4f778b2d2ae959a2e48ec76a6c26e8b3127",
         x86_64_linux: "2fc98db127c611be0c110af11b5b72759f7d736893dddc81df73b7b59b30f15a"

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
