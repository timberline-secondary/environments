# Used to boot off everyone who is logged in.
# Temp solution to prevent students with mutliple log ins at the same time causing problems with locked files etc.
class profile::config::restart_daily {

  cron { 'cron-reboot':
      ensure  => present,
      command => '/sbin/shutdown -r +5',
      user    => 'root',
      minute  => 0,
      hour    => 6,
  }

}
