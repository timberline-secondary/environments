# Installs lightDM and configures it: 
# - Sets it to the deafult display manager
# - Enables the Guest session
# - Turn on numlock
class profile::config::lightdm {

  include ::lightdm

  class { '::lightdm':
    config => {
      'Seat:*' => {
        'greeter-show-manual-login' => true,
        'greeter-hide-users=true'   => true,
        'greeter-setup-script'      => '/usr/bin/numlockx on'
      }
  }

}
