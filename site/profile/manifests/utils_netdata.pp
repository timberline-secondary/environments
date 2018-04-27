class profile::utils_netdata {

  # package {'net-tools':
  #     ensure => latest,
  # }

  exec {'netdata-kickstart':
    command => "bash <(curl -Ss https://my-netdata.io/kickstart.sh) --dont-wait",
    path    => "/bin/",
    creates => "/etc/netdata"
  }

}