node default {

	class { 'helloworld': }
	class { 'helloworld::motd': }

	class { 'ldap_client':}

	class { 'home_dirs':}

	class { 'hs_desktop':}
	class { 'student_apps': }

	class { 'printers': }

}
