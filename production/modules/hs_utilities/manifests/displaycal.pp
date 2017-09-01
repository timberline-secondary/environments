
class hs_utilities::displaycal {

  notify { 'Puppet Module - Utilities::DisplayCAL': }

  # Display Calibration
  package { 'icc-profiles':
		ensure	=> absent,
	}
  package { 'icc-profiles-free':
		ensure  => absent,
	}

  # DisplayCAL deb, https://displaycal.net/#download
  file { '/opt/displayCAL':
		ensure	=> directory,
	}
	file { 'displayCAL-deb':
		path	=> '/opt/displayCAL/DisplayCAL.deb',
		owner	=> root,
		group	=> root,
		mode	=> '644',
		ensure	=> present,
		source	=> 'puppet:///modules/hs_utilities/displaycal/DisplayCAL.deb',
		require => File['/opt/displayCAL'],
	}

	include gdebi
	package { 'displayCAL':
		provider => gdebi,
		ensure	=> absent, # causing pop-up problem!!
		source => '/opt/displayCAL/DisplayCAL.deb',
		require => File['displayCAL-deb'],
	}

}

