class profile::vs_code {


  include wget
  include gdebi

  # deb direct install
  # wget::fetch { 'code_1.33.1_amd64.deb':
  #   source      => 'https://packages.microsoft.com/repos/vscode/pool/main/c/code/code_1.33.1-1554971066_amd64.deb',
  #   destination => '/tmp/',
  #   cache_dir   => '/var/cache/wget',
  # } ~>
  #   package { 'code':
  #     provider => gdebi,
  #     ensure   => latest,
  #     source   => '/tmp/code_1.33.1_amd64.deb',
  #   }

  # SNAP install

  # package { 'code':
  #   ensure   => purged,
  #   provider => snap,
  #   # install_options => '--classic'  # this doesn't work I think.
  # }

  # include wget
  # include gdebi
  #
  # wget::fetch { 'code_latest_amd64.deb':
  #   source      => 'https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable',
  #   destination => '/tmp/',
  #   cache_dir   => '/var/cache/wget',
  # } ~>
  #   package { 'vs_code':
  #     provider => gdebi,
  #     ensure   => latest,
  #     source   => '/tmp/code_latest_amd64.deb',
  #   }


  # apt install

  # use this to install microsoft keys
  wget::fetch { 'packages-microsoft-prod.deb':
    source  => 'https://packages.microsoft.com/config/ubuntu/14.04/packages-microsoft-prod.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
  package { 'Microsoft-product-packages':
    provider => gdebi,
    ensure	=> latest,
    source => '/tmp/packages-microsoft-prod.deb',
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