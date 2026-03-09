cask "pnpm" do
  arch arm: "arm64", intel: "x64"
  os macos: "macos", linux: "linux"

  formula = Formula[token]
  version "10.30.3"
  sha256 arm:          "ccfb6e54fe29d13715e2fe418ef0374cde5a7f68b95f5ed5da5f564886af9d17",
         intel:        "d9be0fd3989c09f5abf7e52f10d8d0294f757af61bbbd59727d607c85205a788",
         arm64_linux:  "9488f48d6967bfa8f5ebc5c077aae297d2fe25287697b4c8edf991ff945d8af7",
         x86_64_linux: "5dc971e801610471b5cd6729ba289531be6695bd50d5e833fe22b18896b13a06"

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
