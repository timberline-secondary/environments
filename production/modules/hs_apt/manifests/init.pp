
class hs_apt {

  # https://forge.puppet.com/puppetlabs/apt
  include apt
  # https://forge.puppet.com/puppet/unattended_upgrades
  # include unattended_upgrades
  
  class { 'unattended_upgrades':
    auto => { 'reboot' => false,
              'reboot_time' => '4am', 
    },
    origins => ['${distro_id}:${distro_codename}-updates', '${distro_id}:${distro_codename}-security'],
  }
  
  file { 'old50':
    path    => '/etc/apt/apt.conf.d/50unattended-upgrades.ucf-dist',
    ensure  => absent,
  }
  
  
#  file { 'upgrade_initiator':
#    path    => '/etc/upgrade_initiator',
#    # ensure  => file,
#    source => "puppet:///modules/hs_apt/upgrade_initiator",
#  }


#  exec { "/usr/bin/apt-get -y dist-upgrade":
#    refreshonly => true,
#    subscribe => File["upgrade_initiator"],
#  }



#  class { 'apt':
#    update => {
#      frequency => 'daily',
#    },
#  }

# Do this: https://www.memonic.com/user/pneff/folder/55756627-f51c-43f0-adfd-777635574108/id/1Z9999x
#  exec { "upgrade":
#    command => "apt-get -y dist-upgrade",
#    path => "/usr/bin/",
#  }

#  cron { 'cron-upgrade':
#    command => '/usr/bin/apt -y full-upgrade',
#    user    => 'root',
#    minute  => 0,
#    hour => 4,
#    ensure => absent,
#  }
  
  # Used to boot off everyone who is logged in.  
  # Temp solution to prevent students with mutliple log ins at the same time causing 
  # problems with locked files etc.
  cron { 'cron-reboot':
    command => '/sbin/shutdown -r +5',
    user    => 'root',
    minute  => 0,
    hour => 6,
    ensure => present,
  }

}
