#
class profile::apps::gimp {

  package { 'gimp':
      ensure  => latest,
    #   require => [ Class['apt::update'], Apt::Ppa['ppa:otto-kesselgulasch/gimp'] ],
  }
#   package { 'gmic':
#       ensure  => absent,
#       require => [ Class['apt::update'], Package['gimp'] ],
#   }
#   package { 'gimp-gmic':
#       ensure  => absent,
#       require => [ Class['apt::update'], Package['gimp'],  Package['gmic'] ],
#   }

#   package { 'gimp-plugin-registry':
#       ensure  => absent,
#       require => [ Class['apt::update'], Package['gimp'] ],
#     }

}
