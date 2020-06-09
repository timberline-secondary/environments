# Requires a guest user to be created in ldap first!
class profile::config::guest_user {

  include profile::utils::reboot_after_run

  # configure nslcd
  # file_line { 'nslcd.conf/uri':
  #   path    => '/etc/nslcd.conf',
  #   match   => '^uri\ ldap://',
  #   line    => 'uri ldap://192.168.43.3',
  #   require => Package['libnss-ldapd'],
  #   notify  => Reboot['after_run'],
  # }


  file { 'post_login_default':
    ensure => file,
    path   => '/etc/gdm/PostLogin/Default',
    source => 'puppet:///modules/profile/guest_account/post_login_default.sh',
    mode   => '0755'
  }

  file { 'post_session_default':
    ensure => file,
    path   => '/etc/gdm/PostSession/Default',
    source => 'puppet:///modules/profile/guest_account/post_sessiondefault.sh',
    mode   => '0755'
  }

}
