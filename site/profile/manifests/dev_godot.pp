class profile::dev_godot {
	# https://cialu.net/install-godot-game-engine-on-fedora-or-ubuntu/

  download_uncompress { 'install-godot':
    download_base_url => 'https://downloads.tuxfamily.org/godotengine',
    distribution_name => "3.0.6/Godot_v3.0.6-stable_x11.64.zip",
    dest_folder       => '/opt',
    creates           => '/opt/Godot_v3.0.6-stable_x11.64',
    uncompress        => 'zip',
    user              => root,
    group             => root,
  }

  include wget
  wget::fetch { 'godot icon':
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
Version=3.0.6
Name=Godot
Comment=Create different games
Exec=/opt/Godot_v3.0.6-stable_x11.64
Icon=/usr/share/icons/godot.svg
Terminal=false
Type=Application
Categories=Development; Games;
Name[en_US]=godot.desktop
GenericName[en_US]=Game development platform
Comment[en_US]=Create different games!",
  }


}