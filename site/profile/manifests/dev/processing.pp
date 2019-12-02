# Processing visual scripting platform and libraries
class profile::dev::processing {

  $version = '3.5.3'
  $package_name = 'processing'
  $archive_name = "${package_name}-${version}-linux64.tgz"
  $source_url = "http://download.processing.org/${$archive_name}"

  $install_path = '/opt/'
  $executable = "/opt/${package_name}-${version}/${package_name}"
  $icon = "/usr/share/icons/${package_name}.png"
  $desktop_file = "/usr/share/applications/${package_name}.desktop"

  # archive { $executable:
  #   ensure => present,
  #   source => $source_url,
  # }

  archive { $archive_name:
    path         => "/tmp/${archive_name}",
    source       => $source_url,
    extract      => true,
    extract_path => $install_path,
    creates      => "${install_path}/${package_name}-${version}",
    cleanup      => true,
    # require      => File['wso2_appdir'],
  }

  # file { $executable:
  #   mode      => '0755',
  #   subscribe => Archive[$executable],
  # }

  archive { $icon:
    ensure => present,
    source => 'https://processing.org/img/processing3-logo.png',
  }

  file { $desktop_file:
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => "[Desktop Entry] 
Name=processing
Comment=Processing software sketchbook. 
Exec=${executable}
Icon=${icon}
Terminal=false
Type=Application
StartupNotify=true
Categories=Programming ",
  }

}
