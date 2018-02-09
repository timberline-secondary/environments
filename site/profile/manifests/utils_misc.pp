class profile::utils_misc {

  include profile::common_wine

  package {'iptux': # LAN chat and file transfer
    ensure  => latest,
  }
  package {'xpad': # Desktop stickynote app
    ensure  => latest,
  }
  package {'exfat-fuse': # mounting exFAT (USB/SD card) drives
    ensure  => latest,
  }

  package{'kmag':}
  package{'unzip':}
  package{'screen':}

  package{'telnet':}


}