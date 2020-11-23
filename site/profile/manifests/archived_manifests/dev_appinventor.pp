class profile::dev_appinventor {

  # http://appinventor.mit.edu/explore/ai2/linux.html

  include wget
  include gdebi

  wget::fetch { 'appinventor2-setup_2.3_all.deb':
    source  => 'http://128.52.184.65/appinventor2-setup_2.3_all.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
  package { 'AppInventor2':
    provider => gdebi,
    ensure	=> latest,
    source => '/tmp/appinventor2-setup_2.3_all.deb',
  }

}