#
class profile::multimedia::utils_and_codecs {
  package {'ffmpeg':
    ensure => latest,
  }

}
