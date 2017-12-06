class hs_student_apps::chrome {

  # https://tecadmin.net/install-google-chrome-in-ubuntu/
  # https://ask.puppet.com/question/32773/keeping-the-latest-stable-chrome-installed-ubuntu/

  include apt

  apt::source { 'chrome-repo':
    comment  => 'Chrome official repo... I think',
    location => 'http://dl.google.com/linux/chrome/deb/',
    release  => 'stable',
    repos    => 'main',
    key      => {
      source     => 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
      # 'server' => 'hkp://keyserver.ubuntu.com:80', #  default anyway
    },
  }

  package { 'google-chrome-stable':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Source['chrome-repo'] ],
  }


}
