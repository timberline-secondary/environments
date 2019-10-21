# Cura Slicer and 3D print software
class profile::apps::cura {

  $cura_version = '4.3.0'
  $cura_executable = "/opt/Cura-${cura_version}"
  $cura_url = "https://github.com/Ultimaker/Cura/releases/download/4.3.0/Ultimaker_Cura-${cura_version}.AppImage"
  $cura_icon = "/usr/share/icons/cura.png"
  $cura_desktop_file = '/usr/share/applications/cura.desktop'

  archive { $cura_executable:
    ensure => present,
    source => $cura_url,
  }

  archive { $cura_icon:
    ensure => present,
    source => 'https://github.com/Ultimaker/Cura/raw/4.3.0/icons/cura-128.png',

  }

  file { $cura_desktop_file:
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '755',
    content => "[Desktop Entry] 
Encoding=UTF-8
Version=${cura_version}
Name=Cura
Comment=3D print stuff
Exec=${cura_executable}
Icon=${cura_icon}
Terminal=false
Type=Application
Categories=Utility; Printing;
Name[en_US]=cura.desktop
GenericName[en_US]=3D printer / slicing GUI built on top of the Uranium framework 
Comment[en_US]=3D print stuff",
  }


}
