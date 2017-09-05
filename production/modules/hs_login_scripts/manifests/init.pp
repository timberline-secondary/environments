class hs_login_scripts {
  # Scripts that run when users log in
  # http://www.linuxfromscratch.org/blfs/view/cvs/postlfs/profile.html
  # https://bash.cyberciti.biz/guide//etc/profile.d
  file { '/etc/profile.d/hs-gnome-alt-key.sh':
     ensure  => file,
     source  => "puppet:///modules/hs_login_scripts/hs-gnome-alt-key.sh",
  }

}


