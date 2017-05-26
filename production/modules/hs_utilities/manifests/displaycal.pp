
class hs_utilities::displaycal {

  notify { 'Puppet Module - Utilities::DisplayCAL': }

  # Display Calibration
  package { 'icc-profiles': }
  package { 'icc-profiles-free': }

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
		ensure	=> latest,
		source => '/opt/displayCAL/DisplayCAL.deb',
		require => File['displayCAL-deb'],
	}

}

