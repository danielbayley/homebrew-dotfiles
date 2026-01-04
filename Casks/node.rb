class NoDownloadStrategy < NoUnzipCurlDownloadStrategy
  def fetch(**)
    touch cached_location
  end
end

cask "node" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  formula = Formula[token]
  version formula.version.to_s
  sha256 :no_check

  url "https://nodejs.org/download/release/v#{version}/node-v#{version}-#{os}-#{arch}.tar.gz",
      using: NoDownloadStrategy
  name "Node.js"
  desc "#{formula.desc}, managed by pnpm"
  homepage "https://#{url.uri.host}"

  livecheck do
    formula "#{formula.tap.name}/node"
  end

  depends_on cask: "danielbayley/dotfiles/pnpm"

  pnpm       = Formula["pnpm"]
  pnpm_bin   = "#{HOMEBREW_PREFIX}/bin/pnpm"
  pnpm_home  = ENV.fetch "HOMEBREW_PNPM_HOME", "#{Dir.home}/Library/pnpm"
  pnpm_store = "#{pnpm_home}/store/v#{pnpm.version.major}"
  pnpm_cache = "#{pnpm_store}/#{URI.encode_www_form_component url.uri}"
  env = {
    "PNPM_HOME" => pnpm_home,
    "PATH"      => pnpm_home,
  }

  binary "#{pnpm_home}/node"
  binary "#{pnpm_home}/nodejs"
  binary "#{pnpm_home}/npm"
  binary "#{pnpm_home}/npx"

  # https://pnpm.io/cli/env
  preflight do
    system_command pnpm_bin,
                   args:         %W[env use --global #{version}],
                   env:          env,
                   must_succeed: true
  end

  uninstall_preflight do
    next unless Dir.exist? "#{pnpm_home}/nodejs/#{version}"

    system_command pnpm_bin,
                   args:         %W[env remove --global #{version}],
                   env:          env,
                   print_stderr: false
  end

  # https://pnpm.io/uninstall
  uninstall delete: %W[
              #{pnpm_home}/node
              #{pnpm_home}/nodejs_current
              #{pnpm_home}/np{m,x}
            ],
            rmdir:  "#{pnpm_home}/nodejs"

  semver_pattern = "*.*.*"
  zap trash: %W[
        #{pnpm_home}/nodejs/#{semver_pattern}
        #{pnpm_cache.gsub version, semver_pattern}
      ],
      rmdir: "#{pnpm_home}/nodejs"

  caveats do
    path_environment_variable pnpm_home
  end
end
