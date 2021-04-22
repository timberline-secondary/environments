# Add record to DNS
# insecurely
#
class profile::config::dns {

  $dns_server_ip = '192.168.66.40'
  $fqdn = $facts['networking']['fqdn']
  $ip = $facts['networking']['ip']

  file { '/etc/nsupdate':
    ensure  => 'present',
    content => "
server ${$dns_server_ip}
update delete ${fqdn} A
update add ${fqdn} 86400 A ${ip}
send
"
  }

  exec { 'nsupdate':
    path     => ['/bin', '/usr/bin'],
    command  => 'nsupdate /etc/nsupdate',
    provider => 'shell',
    require  => File['/etc/nsupdate'],
  }

  # The cronw ill keep running even if puppet runs are failing, this will keep the 
  # workstation on the network for a bit longer at least, but puppet is still required to update the 
  # /etc/nsupdate file to ensure it has the wokrstation's current IP, in case it hase changed
  cron { 'nsupdate':
    command => '/usr/sbin/nsupdate /etc/nsupdate',
    user    => 'root',
    minute  => 0,  # once per hour on minute 0
    require => File['/etc/nsupdate']
  }



}


