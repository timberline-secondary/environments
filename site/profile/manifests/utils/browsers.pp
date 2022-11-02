#
class profile::utils::browsers {

  package { 'firefox':
      ensure => latest,
  }

  # for Firefox
  package {'flashplugin-installer':
    ensure => latest,
  }

  # Chromium DOESNT WORK due do being installed as a SNAP which is brokenw ith autofs
  # https://bugs.launchpad.net/ubuntu/+source/snapd/+bug/1884299
  # package { 'chromium-browser':
  #     ensure => latest,
  # }

  #############
  #
  # Chrome
  #
  #############

  include gdebi

  archive { '/tmp/chrome.deb':
    ensure => present,
    source => 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb',
  }

  package { 'chrome':
    ensure    => latest,
    provider  => gdebi,
    source    => '/tmp/chrome.deb',
    subscribe => Archive['/tmp/chrome.deb']
  }

}
