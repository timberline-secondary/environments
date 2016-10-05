
class hs_apt {

  # https://forge.puppet.com/puppetlabs/apt
  include apt
  # https://forge.puppet.com/puppet/unattended_upgrades
  # include unattended_upgrades
  
  class { 'unattended_upgrades':
    auto => { 'reboot' => true,
              'reboot_time' => 4, },
  }

#  class { 'apt':
#    update => {
#      frequency => 'daily',
#    },
#  }

# Do this: https://www.memonic.com/user/pneff/folder/55756627-f51c-43f0-adfd-777635574108/id/1Z9999x

#        exec { "upgrade":
#                command => "apt full-upgrade",
#                path => "/usr/bin/",
#        }

  cron { 'cron-upgrade':
    command => '/usr/bin/apt -y full-upgrade',
    user    => 'root',
    minute  => 50,
    hour => 9,
    ensure => absent,
  }

}
