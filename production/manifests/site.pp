node default {

	class { 'helloworld': }
	class { 'helloworld::motd': }

	class { 'hs_ldap_client':}

	class { 'hs_home_dirs':}

	class { 'hs_desktop':}
	class { 'hs_student_apps': }
	class { 'hs_student_apps::kaku' }

	class { 'hs_printers': }
	
	class { 'hs_utilities': }
	
	class { 'hs_admin_tools': }
	class { 'hs_admin_tools::ssh': }
	class { 'hs_admin_tools::screencasting': }

	class { 'hs_developer_tools': }
	class { 'hs_developer_tools::eclipse': }
	class { 'hs_developer_tools::python': }
	class { 'hs_developer_tools::unity3d': }
}
