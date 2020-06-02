# Installs lightDM and configures it: 
# - Sets it to the deafult display manager
# - Enables the Guest session
# - Turn on numlock
# https://forge.puppet.com/gizmoguy/lightdm

class profile::config::lightdm {

  class { '::lightdm':
    config => {
      'Seat:*' => {
        'greeter-show-manual-login' => true,
        'greeter-hide-users=true'   => true,
        'greeter-setup-script'      => '/usr/bin/numlockx on'
      }
    }
  }

}
