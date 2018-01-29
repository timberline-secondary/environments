class profile::base {
  #the base profile should include component modules that will be on all nodes

  # MOTD
  $timestamp = generate('/bin/date')
  file { '/etc/motd':
  	owner => 'root',
        group => 'root',
        mode => '0644',
        content => "Running on the new puppet role/profile paradigm. Last run: ${timestamp}\n",
  }

  package { 'openssh-server':
    ensure  => latest,
  }


}
