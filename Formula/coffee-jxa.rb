require_relative "../lib/utils"

class CoffeeJxa < Formula
  desc "Simple wrapper around coffee-cli to run JXA scripts written in CoffeeScript"
  homepage "https://github.com/danielbayley/homebrew-dotfiles"
  url homepage, using: :no_download
  version "latest"
  cached_location, = HOMEBREW_CACHE.glob "downloads/*--" + File.basename(homepage)
  sha256 Digest::SHA256.hexdigest cached_location.read
  license "MIT"

  depends_on "node"

  def install
    npx = "npx --yes --silent --no-update-notifier"
    (bin/name.parameterize).write <<~EOS
      #! /bin/zsh --no-rcs --pipe-fail
      #{npx} --package coffeescript coffee --bare --print $1 |
      osascript -l JavaScript - ${@:2}
    EOS
  end

  test do
    app = "System Events"
    domain = app.parameterize separator: ""

    script = "test.coffee"
    (testpath/script).write <<~EOS
      #! /usr/bin/env #{name.parameterize}
      run = ([,domain ]) =>
        bundle_id = "com.\#{domain}.#{domain}"
        Application('#{app}').id() == bundle_id
    EOS
    stdout = shell_output "#{bin/name.parameterize} #{script} 1 apple"
    assert_equal true.to_s, stdout.chomp
  end
end
