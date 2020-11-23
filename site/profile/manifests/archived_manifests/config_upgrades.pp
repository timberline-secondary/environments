class profile::config_upgrades {

    # https://forge.puppet.com/puppet/unattended_upgrades
    # include unattended_upgrades

    include apt

    class { 'unattended_upgrades':
      auto => { 'reboot' => false,
                'reboot_time' => '4am',
      },
      origins => ['${distro_id}:${distro_codename}-updates', '${distro_id}:${distro_codename}-security'],
    }

}