class profile::games::minecraft {

  include gdebi

  archive { '/tmp/minecraft.deb':
    ensure => present,
    source => 'https://launcher.mojang.com/download/Minecraft.deb',
  }

  package { 'minecraft':
    ensure    => latest,
    provider  => gdebi,
    source    => '/tmp/minecraft.deb',
    subscribe => Archive['/tmp/minecraft.deb']
  }

}
