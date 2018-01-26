class profile::utils_multimedia {

  package {'vlc':
      ensure => present,
  }

  #############
  #
  # Kaku
  # http://kaku.rocks/
  #
  #############

	file { 'kaku-deb':
		path	=> '/tmp/Kaku-1.9.0-amd64.deb',
		owner	=> root,
		group	=> root,
		mode	=> '644',
		ensure	=> present,
		source	=> 'https://github.com/EragonJ/Kaku/releases/download/1.9.0/Kaku-1.9.0-amd64.deb',
  }

  include gdebi
  package { 'kaku':
    provider => gdebi,
    ensure	=> latest,
    source => '/tmp/Kaku-1.9.0-amd64.deb',
    require => File['kaku-deb']
  }

}
