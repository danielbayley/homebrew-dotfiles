cask "pnpm" do
  arch arm: "arm64", intel: "x64"
  os macos: "macos", linux: "linux"

  formula = Formula[token]
  version "10.28.2"
  sha256 arm:          "38a23bf53d918b5192f71ed58e6df9609da478790f89b20ca5f45c3cd46d1d2c",
         intel:        "2b86ff518aa100701aecb1b37b84e9ba2aaf0b7c1803dcc9b3a0f7d0681bd27d",
         arm64_linux:  "6f265c811d1aef8e817e0017cd700d0d345a1100bd8a90358db64eaab2fbff85",
         x86_64_linux: "9f38396f660cd3b1f71e0b0af0b7ba22dd1fd446dc37840a1b6a025868557390"

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
