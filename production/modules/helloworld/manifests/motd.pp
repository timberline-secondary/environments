$timestamp = generate('/bin/date')

class helloworld::motd {
	file { '/etc/motd':
	owner => 'root',
	group => 'root',
	mode => '0644',
	content => "Production puppetmaster is in control. Last run: ${timestamp}\n",
	}
}
