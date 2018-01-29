class profile::common_git {

  package { 'git':
		ensure  => latest,
	}

}