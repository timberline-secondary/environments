class profile::dev_git_desktop {

  include profile::common_git

  include wget
  include gdebi

  wget::fetch { 'desktop_1.0.4-beta0_amd64.deb':
    source      => 'https://github.com/gengjiawen/desktop/releases/download/v1.0.4-beta0/desktop_1.0.4-beta0_amd64.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
    package { 'GithubDesktop':
      provider => gdebi,
      ensure   => latest,
      source   => '/tmp/desktop_1.0.4-beta0_amd64.deb',
    }

}
