class profile::app::steam {

  package { 'steam':
      # ensure => latest,
      ensure => purged,
  }

  package { 'steamcmd':
      # ensure => latest,
      ensure => purged,
  }


  # file { '/usr/bin/steam':
  #   ensure  => file,
 	# 	owner	=> root,
		# group	=> root,
		# mode	=> '755',
  #   source  => "puppet:///modules/profile/steam/steam",
  #   subscribe => Package['steam']
  # }
  #
  #
  # # Remove the update notifier to prevent pop-up on all users.
  # file { 'steam-update-notifier':
  #   ensure => absent,
  #   path => '/var/lib/update-notifier/user.d/steam-install-notify',
  #   subscribe => Package['steam'],
  # }

}
