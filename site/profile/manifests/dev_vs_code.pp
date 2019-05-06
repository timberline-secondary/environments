class profile::dev_vs_code {

  # package { 'code':
  #   ensure   => purged,
  #   provider => snap,
  #   # install_options => '--classic'  # this doesn't work I think.
  # }

  include wget
  include gdebi

  wget::fetch { 'code_latest_amd64.deb':
    source      => 'https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
    package { 'vs_code':
      provider => gdebi,
      ensure   => latest,
      source   => '/tmp/code_latest_amd64.deb',
    }

}