class hs_developer_tools::unity3d {

	# Latest Unity build for Linux
	# http://forum.unity3d.com/threads/unity-on-linux-release-notes-and-known-issues.350256/
	
	package { 'monodevelop':
		ensure  => latest,
	}

	file { '/opt/unity3d': 
		ensure	=> directory,
	}

	file { 'unity-editor-deb':
		path	=> '/opt/unity3d/unity-editor-5.4.0b21+20160609_amd64.deb',
		owner	=> root,
		group	=> root,
		mode	=> '644',
		ensure	=> present,
		source	=> 'puppet:///modules/hs_developer_tools/unity-editor-5.4.0b21+20160609_amd64.deb',
		require => File['/opt/unity3d'],
	}

	package { 'unity-editor': 
		provider => dpkg,
		ensure	=> latest,
		source => '/opt/unity3d/unity-editor-5.4.0b21+20160609_amd64.deb',
		require => File['unity-editor-deb'],
	}

}
