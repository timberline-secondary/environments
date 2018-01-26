class profile::utils_misc {

  package {'iptux': # LAN chat and file transfer
    ensure  => latest,
  }
  package {'xpad': # Desktop stickynote app
    ensure  => latest,
  }
  package {'exfat-fuse': # mounting exFAT (USB/SD card) drives
    ensure  => latest,
  }

  package { 'unity-tweak-tool':
    ensure  => latest,
  }

  package { 'gnome-tweak-tool':
    ensure  => latest,
  }

  package{'kmag':}
  package{'unzip':}
  package{'typecatcher':}
  package{'unifont':}
  package{'screen':}


}