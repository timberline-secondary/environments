class profile::dev_godot {
	# https://cialu.net/install-godot-game-engine-on-fedora-or-ubuntu/

  download_uncompress { 'godot-binary':
    distribution_name => 'https://downloads.tuxfamily.org/godotengine/3.0.6/Godot_v3.0.6-stable_x11.64.zip',
    dest_folder       => '/opt',
    creates           => '/opt/Godot',
    uncompress        => 'zip',
    user              => root,
    group             => root,
  }
#
#   file { 'godot.desktop':
#     ensure  => file,
#     owner   => root,
#     group   => root,
#     mode    => '755',
#     content => "[Desktop Entry]\n
# Encoding=UTF-8\n
# Version=3.0.6\n
# Name=Godot\n
# Comment=Create different games\n
# Exec=/opt/Godot/Godot\n
# Icon=godot\n
# Terminal=false\n
# Type=Application\n
# Categories=Development; Games;\n
# Name[en_US]=godot.desktop\n
# GenericName[en_US]=Game development platform\n
# Comment[en_US]=Create different games!\n",
#   }
#

}