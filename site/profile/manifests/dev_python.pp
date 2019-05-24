class profile::dev_python {

  apt::ppa { 'ppa:jonathonf/python-3.6':
      ensure => present,
  }

  class { 'python' :
    version    => 'python3.6',
    pip        => 'latest',
    dev        => 'absent',
    virtualenv => 'latest',
    gunicorn   => 'absent',
    require    => [ Class['apt::update'], Apt::Ppa['ppa:jonathonf/python-3.6'] ],
  }

  package { 'idle3':
    ensure  => latest,
  }

  # package { 'python3-pip':
    # ensure => latest,
  # }

  apt::ppa { 'ppa:mystic-mirage/pycharm':
      ensure => present,
  }
  package { 'pycharm':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:mystic-mirage/pycharm'] ],
  }
}
