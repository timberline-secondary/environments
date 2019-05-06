class profile::dev_vs_code {

  package { 'code':
    ensure   => purged,
    provider => snap,
    # install_options => '--classic'  # this doesn't work I think.
  }

  include wget
  include gdebi

  wget::fetch { 'vs_code':
    source      => 'https://go.microsoft.com/fwlink/?LinkID=760868',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
    package { 'vs_code':
      provider => gdebi,
      ensure   => latest,
      source   => '/tmp/vs_code',
    }

}