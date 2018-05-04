class profile::utils_discord {
  include wget
  include gdebi

  wget::fetch { 'discord-0.0.5.deb':
    source      => 'https://dl.discordapp.net/apps/linux/0.0.5/discord-0.0.5.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
    package { 'discord':
      provider => gdebi,
      ensure   => latest,
      source   => '/tmp/discord-0.0.5.deb',
    }

}