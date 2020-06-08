#
class profile::multimedia::utils_and_codecs {
  
  package {'ffmpeg':
    ensure => latest,
  }

  # includes MS Fonts
  package {'ubuntu-restricted-extras':
    ensure => latest,
  }

  package {'typecatcher':
    ensure => latest,
  }

}
