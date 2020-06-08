# unattended upgrades and release upgrades
class profile::config::upgrades {

    # https://forge.puppet.com/puppet/unattended_upgrades
    # include unattended_upgrades

    include apt

    class { 'unattended_upgrades':
      auto    => {'reboot'      => true,
                  'reboot_time' => '4am',
      },
      origins => ['${distro_id}:${distro_codename}-updates', '${distro_id}:${distro_codename}-security'],
    }

    # prevent from asking to upgrade OS
    # https://askubuntu.com/questions/115913/disable-ubuntu-update-managers-new-version-warning

    $upgrades_file = '/etc/update-manager/release-upgrades'

    file_line { 'release-upgrades':
      ensure  => present,
      path    => $upgrades_file,
      replace => true, # default is true
      line    => 'Prompt=never',
      match   => '^Prompt'
    }

}
