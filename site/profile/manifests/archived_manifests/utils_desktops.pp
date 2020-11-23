class profile::utils_desktops {

  package { 'cinnamon-desktop-environment':
    ensure  => latest,
  }


  package { 'unity-greeter-badges':
    ensure  => latest,
  }

  package {'xfce4':
      ensure  => latest,
  }

}

