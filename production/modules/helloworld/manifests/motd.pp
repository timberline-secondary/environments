$timestamp = generate('/bin/date', '+%Y%d%m_%H:%M:%S')

class helloworld::motd {
	file { '/etc/motd':
	owner => 'root',
	group => 'root',
	mode => '0644',
	content => "Production puppetmaster is in control. Last run: ${timestamp}\n",
	}
}
