node default {

	class { 'helloworld': }
	class { 'helloworld::motd': }

	class { 'hs_ldap_client':}

	class { 'hs_home_dirs':}

	class { 'hs_desktop':}
	class { 'hs_student_apps': }
	class { 'hs_student_apps::kaku': }
	class { 'hs_student_apps::blender': }
	class { 'hs_student_apps::spotify': }

	class { 'hs_printers': }
	
	class { 'hs_utilities': }
	class { 'hs_utilities::displaycal': }
	
	class { 'hs_games': }
	
	class { 'hs_admin_tools': }
	class { 'hs_admin_tools::ssh': }
	class { 'hs_admin_tools::screencasting': }

	class { 'hs_developer_tools': }
	class { 'hs_developer_tools::eclipse': }
	class { 'hs_developer_tools::python': }
	class { 'hs_developer_tools::unity3d': }
	class { 'hs_developer_tools::appinventor': }
	class { 'hs_developer_tools::pycharm': }
	class { 'hs_developer_tools::atom': }
	class { 'hs_developer_tools::android': }
	
	class { 'hs_apt':}
}
