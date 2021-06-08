require_relative "../lib/utils"

cask "sudo" do
  version :latest
  sha256 :no_check

  url "https://support.apple.com/guide/mac-help/mchl16fbf90a/mac", using: NoDownloadStrategy
  name token
  desc "Configure #{token} and enable Touch ID for commands in Terminal"
  homepage url.uri

  depends_on macos: ">= :sierra"

  user = ENV["USER"]
  sudo = "/etc/pam.d/#{token}"
  sudoers = "/etc/sudoers.d/#{user.downcase}"
  touch_id = "auth       sufficient     pam_tid.so"
  security = "/usr/bin/security"

  replace = lambda do |*args|
    Dir.mktmpdir do |tmp|
      FileUtils.cp sudo, tmp
      inreplace "#{tmp}/#{token}", *args
      system_command "/bin/mv", args: ["-f", "#{tmp}/#{token}", sudo], sudo: true
    end
  end

  preflight do
    replace[/^(#.*)$/, "\\1\n#{touch_id}"]

    nopasswd = %w[
      /usr/sbin/softwareupdate
    ]

    lines = nopasswd.map do |command|
      "#{user} ALL = (root) NOPASSWD: #{command}"
    end

    tmp = Tempfile.new
    tmp.write lines.join "\n"

    system_command "/usr/sbin/chown", args: ["root:wheel", tmp], sudo: true
    system_command "/bin/chmod", args: ["+r", tmp], sudo: true
    system_command "/bin/mv", args: [tmp, sudoers], sudo: true

    require "io/console"
    password = $stdin.getpass "Password:"

    args = %W[add-generic-password -T #{security} -a #{user} -s #{token} -Uw #{password}]
    system_command security, args: args, sudo: true

    File.write askpass = "#{staged_path}/askpass.sh", <<~EOS
      #! /bin/sh
      #{security} find-generic-password -ws #{token}
    EOS
    set_permissions askpass, "+x"
  end

  uninstall_preflight do
    replace["#{touch_id}\n", ""]
  end

  uninstall delete: sudoers, script: {
    executable: security, args: %W[-q delete-generic-password -l #{token}],
    must_succeed: false,
    print_stderr: false
  }
end
