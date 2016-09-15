class hs_games: {

  package { 'inkscape':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:inkscape.dev/stable'] ],
  }



}

