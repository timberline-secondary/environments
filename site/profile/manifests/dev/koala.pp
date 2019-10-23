# Koala CSS Preprocesser GUI 
class profile::dev::koala {
  # http://koala-app.com/

  $version = '2.3.0'
  $install_dir = '/tmp'
  $filename = "koala_${version}_x86_64.deb"

  include gdebi

  archive { $filename:
    ensure => present,
    source => "https://github.com/oklai/koala/releases/download/v${version}/${filename}",
  }

  package { 'Koala':
    ensure    => latest,
    provider  => gdebi,
    source    => "${install_dir}/${filename}",
    subscribe => Archive[$filename],
  }

}
