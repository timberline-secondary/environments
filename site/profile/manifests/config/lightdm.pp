# Installs lightDM and configures it: 
# - Sets it to the deafult display manager
# - Enables the Guest session
class profile::config::lightdm {

  include profile::utils::reboot_after_run

  package { 'lightdm':
    ensure => latest,
    notify => Reboot['after_run'],
  }
