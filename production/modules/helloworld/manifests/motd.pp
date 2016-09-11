
class helloworld::motd {
	$timestamp = generate('/bin/date')
	file { '/etc/motd':
	owner => 'root',
	group => 'root',
	mode => '0644',
	content => "Production puppetmaster is in control. Last run: ${timestamp}\n",
	}
}
