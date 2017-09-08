class hs_student_apps::kaku {

  # NEW DEB RELEASE

  file { '/opt/kaku':
		ensure	=> directory,
	}

	file { 'kaku-deb':
		path	=> '/opt/kaku/Kaku-1.9.0-amd64.deb',
		owner	=> root,
		group	=> root,
		mode	=> '644',
		ensure	=> present,
		source	=> 'puppet:///modules/hs_student_apps/kaku/Kaku-1.9.0-amd64.deb',
		require => File['/opt/kaku'],
	}

	include gdebi
	package { 'kaku':
		provider => gdebi,
		ensure	=> latest,
		source => '/opt/kaku/Kaku-1.9.0-amd64.deb',
		require => File['kaku-deb'],
	}

	/*file { 'Kaku-linux64.zip':
		path	=> '/opt/Kaku-linux64.zip',
		ensure	=> absent,
		source	=> 'puppet:///modules/hs_student_apps/kaku/Kaku-linux64.zip',
	}*/

	# Remove old install

	archive { 'Kaku-linux64':
	   ensure => absent,
	   url => 'https://github.com/EragonJ/Kaku/releases/download/1.7.0/Kaku-linux64.zip',
	   target => '/opt/',
	   follow_redirects => true,
	   extension => 'zip',
	   checksum => false,
	   src_target => '/tmp'
	}

	file { 'Kaku.png':
		path	=> '/usr/share/pixmaps/Kaku.png',
		#owner	=> root,
		#group	=> root,
		#mode	=> '644',
		ensure	=> absent,
		source	=> 'puppet:///modules/hs_student_apps/kaku/kaku.png',
	}

	file { 'Kaku.desktop':
		path	=> '/usr/share/applications/Kaku.desktop',
		owner	=> root,
		group	=> root,
		mode	=> '755',
		ensure	=> absent,
		source	=> 'puppet:///modules/hs_student_apps/kaku/Kaku.desktop',
	}
}
