cask "pnpm" do
  arch arm: "arm64", intel: "x64"
  os macos: "macos", linux: "linux"

  formula = Formula[token]
  version "10.28.0"
  sha256 arm:          "b6cfee40fcb09e68a874ffbf300eb1ef9dec11302fd03637a4bc605f3f9405cb",
         intel:        "99431e91d721169c2050d5e46abefc6f0d23c49e635a5964dcb573d9fe89975a",
         arm64_linux:  "5bf35f1927d5ea0aa76408504f834e3089679d9e18342ab19502a28fb0116391",
         x86_64_linux: "348e863d17a62411a65f900e8d91395acabae9e9237653ccc3c36cb385965f28"

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
