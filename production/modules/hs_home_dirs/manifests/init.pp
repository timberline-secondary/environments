class home_dirs {

  file { '/shared':
    ensure => 'directory',
    mode   => '0777',    
  }

}
