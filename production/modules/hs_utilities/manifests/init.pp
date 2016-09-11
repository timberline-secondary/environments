
class hs_utilities {

  file { '/shared':
    ensure => 'directory',
    mode   => '0777',    
  }

}
