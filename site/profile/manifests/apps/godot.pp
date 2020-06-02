#
class profile::apps::godot {
  # https://cialu.net/install-godot-game-engine-on-fedora-or-ubuntu/

  # should just be able to update this to install a new version
  $godot_version      = '3.2.1'

  download_uncompress { 'install-godot':
    download_base_url => 'https://downloads.tuxfamily.org/godotengine',
    distribution_name => "${godot_version}/Godot_v${godot_version}-stable_x11.64.zip",
    dest_folder       => '/opt',
    creates           => "/opt/Godot_v${godot_version}-stable_x11.64.zip",
    uncompress        => 'zip',
    user              => root,
    group             => root,
  }

  include wget
  wget::fetch { 'godot.svg':
    source      =>
      'https://raw.githubusercontent.com/godotengine/godot/4f5a7ebaecfcf00cf1e5c4af4b20034f0dcecd29/icon.svg',
    destination => '/usr/share/icons/godot.svg',
    cache_dir   => '/var/cache/wget',
  }

  file { '/usr/share/applications/godot.desktop':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '755',
    content => "[Desktop Entry]
Encoding=UTF-8
Version=${godot_version}
Name=Godot
Comment=Create different games
Exec=/opt/Godot_v${godot_version}-stable_x11.64
Icon=/usr/share/icons/godot.svg
Terminal=false
Type=Application
Categories=Development; Games;
Name[en_US]=godot.desktop
GenericName[en_US]=Game development platform
Comment[en_US]=Create different games!\n",
  }


}
