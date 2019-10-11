#
class profile::config::display_manager {

  include ::lightdm

  # class { '::lightdm':
  #   config => {
  #     'Seat:*' => {
  #       'greeter-show-manual-login' => true,
  #       'greeter-hide-users=true'   => true,
  #     }
  # }

  # #this is set up directly by preseed file on install as well.
  # file { '/etc/lightdm':
  #   ensure  => directory,
  # }

  # # https://help.ubuntu.com/community/NumLock
  # package { 'numlockx':
  #   ensure => latest,
  # }

  # file { 'lightdm.conf':
  #   ensure  => file,
  #   path    => '/etc/lightdm/lightdm.conf',
  #   source  => 'puppet:///modules/profile/ldap_client/lightdm/lightdm.conf',
  #   require => File['/etc/lightdm'],
  # }

}
