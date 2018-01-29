class profile::dev_unity3d {
	# Latest Unity build for Linux
  # http://forum.unity3d.com/threads/unity-on-linux-release-notes-and-known-issues.350256/

  include wget
  include gdebi

  wget::fetch { 'unity-editor_amd64-5.6.3xf1Linux.deb':
    source  => 'http://beta.unity3d.com/download/d72e16ff4aba/unity-editor_amd64-5.6.3xf1Linux.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
  package { 'unity-editor':
    provider => gdebi,
    ensure	=> latest,
    source => '/tmp/unity-editor_amd64-5.6.3xf1Linux.deb',
  }

}