#
class profile::apps::krita {

  # there's a bug in QT that causes the repo version of Krita to not work, so instead install the app image
  # package { 'krita':
  #   ensure  => absent,
  # }

  $version = '4.4.2'
  $filename = "krita-${version}-x86_64.appimage"
  $executable = "/opt/${filename}"
  $url = "https://download.kde.org/stable/krita/${version}/${filename}"
  $icon = '/usr/share/icons/krita.svg'
  $desktop_file = '/usr/share/applications/krita.desktop'

  archive { $executable:
    ensure => present,
    source => $url,
  }

  file { $executable:
    mode      => '0755',
    subscribe => Archive[$executable],
  }

  archive { $icon:
    ensure => present,
    source => 'https://upload.wikimedia.org/wikipedia/commons/7/73/Calligrakrita-base.svg',
  }

  file { $desktop_file:
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => "[Desktop Entry] 
Encoding=UTF-8
Version=1.0
Name=Krita
Comment=Painting program
Exec=${executable}
Icon=${icon}
Terminal=false
Type=Application
Categories=Graphics ",
  }


}
