#
class profile::desktop::base {

  package { 'ubuntu-desktop':
    ensure  => latest,
  }

  package { 'ubuntu-drivers':
    ensure  => latest,
  }

}
