class profile::utils_browsers {

  package { 'firefox':
      ensure => latest,
  }
  # for Firefox
  package {'flashplugin-installer':
    ensure => latest,
  }

  package { 'chromium-browser':
      ensure => latest,
  }
  # for Chromium
  package {'pepperflashplugin-nonfree':
    ensure  => latest,
  }

  #############
  #
  # Chrome
  #
  #############

  # https://tecadmin.net/install-google-chrome-in-ubuntu/
  # https://ask.puppet.com/question/32773/keeping-the-latest-stable-chrome-installed-ubuntu/
  # https://www.google.com/linuxrepositories/

  include apt

  apt::source { 'chrome-repo':
    comment  => 'Chrome official repo... I think',
    location => 'http://dl.google.com/linux/chrome/deb/',
    release  => 'stable',
    repos    => 'main',
    key      => {
      id        => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991',
      source    => 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
      # 'server' => 'hkp://keyserver.ubuntu.com:80', #  default anyway
    },
  }

  package { 'google-chrome-stable':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Source['chrome-repo'] ],
  }


}
