class profile::apps::discord {
  include wget
  include gdebi

  # $version = '0.0.9'

  archive { '/tmp/discord.deb':
    ensure => present,
    source      => 'https://discordapp.com/api/download?platform=linux&format=deb',
    # destination => '/tmp/',
    # cache_dir   => '/var/cache/wget',
  }

  package { 'discord':
      provider => gdebi,
      ensure   => latest,
      source   => '/tmp/discord.deb',
      subscribe=> Archive['/tmp/discord.deb']
  }

}
