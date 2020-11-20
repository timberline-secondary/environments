# https://forge.puppet.com/modules/puppetlabs/docker
class profile::dev::nodejs {

  class { 'nodejs':
    version => 'latest',
  }

}
