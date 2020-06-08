#
class profile::multimedia::utils_and_codecs {
  
  package {'ffmpeg':
    ensure => latest,
  }

  package {'ubuntu-restricted-extras':
    ensure => latest,
  }

}
