# https://forge.puppet.com/modules/puppetlabs/docker
class profile::dev::docker {

  class { 'docker':
    version => 'latest',
  }

}
