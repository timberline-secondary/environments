
file { '/devops/RRDI-repo-Linux64-5.0.2GA.zip':
  source => 'puppet:///somemodule//devops/RRDI-repo-Linux64-5.0.2GA.zip'
  notify => Exec['unzip'],
}

file { '/tmp/RRDI_INSTALLATION/':
  ensure => 'directory',
  mode   => '1777',
  owner  => 'user',
  group  => 'user',
}

exec { 'unzip':
  command     => 'unzip /devops/RRDI-repo-Linux64-5.0.2GA.zip -d /tmp/RRDI_INSTALLATION/',
  cwd         => '/home/user/',
  user        => 'root',
  require     => File["/tmp/RRDI_INSTALLATION/"],
  refreshonly => true,
}
