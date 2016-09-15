	/*file { 'unity-editor-deb':
		path	=> '/opt/unity3d/unity-editor-5.5.0b2+20160906_amd64.deb',
		owner	=> root,
		group	=> root,
		mode	=> '644',
		ensure	=> present,
		source	=> 'puppet:///modules/hs_developer_tools/unity-editor-5.5.0b2+20160906_amd64.deb',
		require => File['/opt/unity3d'],
	}*/
	
	/*include gdebi
	package { 'unity-editor': 
		provider => gdebi,
		ensure	=> latest,
		source => '/opt/unity3d/unity-editor-5.5.0b2+20160906_amd64.deb',
		require => File['unity-editor-deb'],
  }*/
