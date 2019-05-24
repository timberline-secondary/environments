class profile::dev_python {

  class { 'python' :
    version    => '3.6',
    pip        => 'latest',
    dev        => 'absent',
    virtualenv => 'latest',
    gunicorn   => 'absent',
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
