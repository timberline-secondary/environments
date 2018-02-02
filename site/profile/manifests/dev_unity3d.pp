class profile::dev_unity3d {
	# Latest Unity build for Linux
  # http://forum.unity3d.com/threads/unity-on-linux-release-notes-and-known-issues.350256/

  include wget
  include gdebi

  package { 'monodevelop':
      ensure  => latest,
  }

  wget::fetch { 'unity-editor_amd64-2017.2.0f3.deb':
    source  => 'http://beta.unity3d.com/download/ee86734cf592/unity-editor_amd64-2017.2.0f3.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
  package { 'unity-editor':
    provider => gdebi,
    ensure	=> latest,
    source => '/tmp/unity-editor_amd64-2017.2.0f3.deb',
  }

  # License Activation
  #  https://forum.unity.com/threads/headless-unity-license-activation-problem.455753/#post-2954781

  #  "To activate from the command line:
  #  Unity -batchmode -nographics -serial XXXX -username myuser@mydomain.com -password MyPassword -quit" - Tak


}