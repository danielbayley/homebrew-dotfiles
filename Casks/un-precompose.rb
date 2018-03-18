cask 'un-precompose' do
  version '1.04'
  sha256 'b57c2907b9f1db2153fe0e2ff9731a1ad6c13e79c91cb0376e4e5e535085d512'

  url 'https://batchframe.com/c/?bfm=' + ENV['HOMEBREW_ADOBE_UN_PRECOMPOSE']
  name 'Un-PreCompose'
  homepage 'https://batchframe.com/tool/un-precompose'

  folder = '/Applications/Adobe Creative Cloud/Adobe After Effects */Plug-ins/'
  latest = Dir[folder].sort { |min, max| min <=> max }[-1]

  artifact "un-precompose_#{version}/MAC64/BatchFrame", target: "#{latest}/BatchFrame"

  link = homepage
  caveats do
    free_license link
  end
  caveats <<~EOS
    Cask requires a HOMEBREW_ADOBE_UN_PRECOMPOSE environment variable to be set
    with the unique portion of the download url supplied in your email receipt.
    Please consider a voluntary purchase if you like this plugin.
  EOS
  caveats "#{name[0]} remains referenced as De-compose within After Effects."
end
