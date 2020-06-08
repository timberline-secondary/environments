class profile::apps::discord {
  include gdebi

  # $version = '0.0.9'

  archive { '/tmp/discord.deb':
    ensure => present,
    source      => 'https://discordapp.com/api/download?platform=linux&format=deb',
  }

  package { 'discord':
      provider => gdebi,
      ensure   => latest,
      source   => '/tmp/discord.deb',
      subscribe=> Archive['/tmp/discord.deb']
  }

}
