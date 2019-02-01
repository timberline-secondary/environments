class profile::utils_discord {
  include wget
  include gdebi

  wget::fetch { 'discord-0.0.8.deb':
    source      => 'https://dl.discordapp.net/apps/linux/0.0.8/discord-0.0.8.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
    package { 'discord':
      provider => gdebi,
      ensure   => latest,
      source   => '/tmp/discord-0.0.8.deb',
    }

}