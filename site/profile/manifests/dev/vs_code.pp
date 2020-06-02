class profile::dev::vs_code {
  # https://code.visualstudio.com/docs/setup/linux

  include wget
  include gdebi

  # use this to install microsoft keys
  wget::fetch { 'packages-microsoft-prod.deb':
    source      => 'https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  }
  ~> package { 'Microsoft-product-packages':
    ensure   => latest,
    provider => gdebi,
    source   => '/tmp/packages-microsoft-prod.deb',
  }

  apt::source { 'microsoft-vscode':
    comment  => 'https://code.visualstudio.com/docs/setup/linux',
    location => 'https://packages.microsoft.com/repos/vscode',
    release  => 'stable',
    repos    => 'main',
    # key      => {
    #   id        => '',
    #   source    => '',
    # },
  }

  package { 'apt-transport-https':
    ensure  => latest,
  }

  package { 'code':
    ensure  => latest,
    require => [ Class['apt::update'], Package['apt-transport-https'], Apt::Source['microsoft-vscode'] ],
  }

}
