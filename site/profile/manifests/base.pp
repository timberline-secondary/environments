class profile::base {
  #the base profile should include component modules that will be on all nodes

  # MOTD
  $timestamp = generate('/bin/date')
  file { '/etc/motd':
  	owner => 'root',
        group => 'root',
        mode => '0644',
        content => "Running dsfsdfsdf on the new role/profile pupper paradigm. Last run: ${timestamp}\n",
  }
}
