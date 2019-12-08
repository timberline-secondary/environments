class profile::app::blender_2_79 {

  # include apt

  apt::ppa { 'ppa:thomas-schiex/blender':
    ensure => present,
  }

  # package {'libopensubdiv':
  #   require => Package['blender'],
  # }

  package { 'blender':
    ensure   => "2.79.b+dfsg0-1",
    #require => [ Class['apt::update'], Apt::Ppa['ppa:thomas-schiex/blender'] ],
  }
}
