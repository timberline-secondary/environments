class hs_student_apps::kaku {

	file { 'Kaku-linux64.zip':
		path	=> '/usr/local/bin/Kaku-linux64.zip',
		ensure	=> absent,
		source	=> 'puppet:///modules/hs_student_apps/kaku/Kaku-linux64.zip',
	}

	archive { 'Kaku-linux64':
	   ensure => present,
	   url => 'https://github.com/EragonJ/Kaku/releases/download/1.7.0/Kaku-linux64.zip',
	   target => '/usr/local/bin',
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
		ensure	=> present,
		source	=> 'puppet:///modules/hs_student_apps/kaku/kaku.png',
	}
	
	file { 'Kaku.desktop':
		path	=> '/usr/share/applications/Kaku.desktop',
		owner	=> root,
		group	=> root,
		mode	=> '644',
		ensure	=> present,
		source	=> 'puppet:///modules/hs_student_apps/kaku/Kaku.desktop',
	}
}
