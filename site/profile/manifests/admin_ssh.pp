class profile::admin_ssh {

	package { 'ssh':
		ensure  => latest,
	}
}