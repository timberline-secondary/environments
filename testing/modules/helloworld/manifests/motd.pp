class helloworld::motd {
	file { '/etc/motd':
	owner => 'root',
	group => 'root',
	mode => '0644',
	content => "Testing puppetmaster is in control.\n",
	}
}
