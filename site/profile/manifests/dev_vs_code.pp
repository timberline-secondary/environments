class profile::dev_vs_code {

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


  include wget
  include gdebi

  #   apt::source { 'vs-code-repo':
  #   comment  => 'https://code.visualstudio.com/docs/setup/linux',
  #   location => 'https://packages.microsoft.com/repos/vscode',
  #   release  => 'stable',
  #   repos    => 'main',
  #   key      => {
  #     id        => 'BC528686B50D79E339D3721CEB3E94ADBE1229CF',
  #     source    => 'https://packages.microsoft.com/keys/microsoft.asc',
  #   },
  # }

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

  # package { 'code':
  #   ensure  => latest,
  #   require => [ Class['apt::update'], Package['Microsoft-product-packages'] ],
  # }

  apt::source { 'microsoft-vscode':
    comment  => 'https://code.visualstudio.com/docs/setup/linux',
    location => 'https://packages.microsoft.com/repos/vscode',
    release  => 'stable',
    repos    => 'main',
    # key      => {
    #   id        => 'BC528686B50D79E339D3721CEB3E94ADBE1229CF',
    #   source    => 'https://packages.microsoft.com/keys/microsoft.asc',
    # },
  }

  package { 'code':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Source['microsoft-vscode'] ],
  }

}