#
class profile::dev::python {

  package { 'python-is-python3':ensure => latest }
  package { 'idle3': ensure  => latest }
  package { 'python3-pip': ensure  => latest }
  package { 'python3-venv': ensure  => latest }

  # Python 3 Development packages
  # https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-programming-environment-on-an-ubuntu-20-04-server

  package { 'build-essential': ensure  => latest }
  package { 'libssl-dev': ensure  => latest }
  package { 'libffi-dev': ensure  => latest }
  package { 'python3-dev': ensure  => latest }

}
