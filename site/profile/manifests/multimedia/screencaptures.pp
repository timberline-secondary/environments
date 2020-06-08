#
class profile::multimedia::screencaptures {

  package {'simplescreenrecorder':
    ensure => latest,
  }

  package {'flameshot':
    ensure => latest,
  }
  
  package {'kmag':
    ensure => latest,
  }

}
