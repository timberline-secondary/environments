class hs_developer_tools::python {
	
	package { 'idle3':
		ensure  => latest,
	}
	
	package { 'python3-pip':
		ensure => latest,
	}
}
