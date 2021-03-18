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
}
