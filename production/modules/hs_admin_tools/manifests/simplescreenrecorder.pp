
    include apt
    
    apt::ppa { 'ppa:maarten-baert/simplescreenrecorder': 
        ensure => present,
    }
    package { 'simplescreenrecorder':
        ensure  => latest,
        require => [ Class['apt::update'], Apt::Ppa['ppa:maarten-baert/simplescreenrecorder'] ],
    }
