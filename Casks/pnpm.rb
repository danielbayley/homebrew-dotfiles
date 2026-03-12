cask "pnpm" do
  arch arm: "arm64", intel: "x64"
  os macos: "macos", linux: "linux"

  formula = Formula[token]
  version "10.32.1"
  sha256 arm:          "b0904b4e0cf36704fcdc24bcdb5f03388799a631510d1fb0d459ea69c7b1e2d9",
         intel:        "8b83277343bbc400fdb90608bd51b4f56e380e6624ac5fd0e11d6c08815e3f04",
         arm64_linux:  "c0db0b837971fde6f9781af8914e54eb163721193a36d35cbcf1794b3474a407",
         x86_64_linux: "c5607a86bfb948297e96b393a53c90107766fe56329e62967b1f239d861d4363"

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
