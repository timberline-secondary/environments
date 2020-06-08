#
class profile::apps::ms_teams {

  include gdebi

  apt::source { 'microsft_teams_repo':
    location => 'https://packages.microsoft.com/repos/ms-teams',
    release  => 'stable',
    repos    => 'main',
    key      => {
      id     => 'BC528686B50D79E339D3721CEB3E94ADBE1229CF',
      # id     => '931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90',
      # id     => 'EFDC8610341D9410',
      # server => 'hkp://keyserver.ubuntu.com:80',
      },
  }
  package { 'teams':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Source['microsft_teams_repo'] ],
  }

}
