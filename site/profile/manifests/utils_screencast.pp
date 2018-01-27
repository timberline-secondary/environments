class profile::utils_screecast {

    include apt

    apt::ppa { 'ppa:maarten-baert/simplescreenrecorder':
        ensure => present,
    }
    package { 'simplescreenrecorder':
        ensure  => latest,
        require => [ Class['apt::update'], Apt::Ppa['ppa:maarten-baert/simplescreenrecorder'] ],
    }

    package { 'key-mon':
        ensure  => latest,
    }

    # Screen gif capturing
    apt::ppa { 'ppa:sethj/silentcast':
        ensure => present,
    }
    package { 'silentcast':
        ensure  => latest,
        require => [ Class['apt::update'], Apt::Ppa['ppa:sethj/silentcast'] ],
    }
    package { 'byzanz':
      ensure  => latest,
    }
}