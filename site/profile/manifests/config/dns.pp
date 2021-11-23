# Add record to DNS
# insecurely
#
class profile::config::dns {

  $dns_server_ip = '192.168.66.40'
  $fqdn = $facts['networking']['fqdn']
  $ip = $facts['networking']['ip']

  # Contents of the file /etc/nsupdate should be something like:
  #
  #server 192.168.66.40
  #update delete tbl-h10-0.hackerspace.tbl A
  #update add tbl-h10-0.hackerspace.tbl 86400 A 192.168.43.141
  #send

  # Needs to run during install too, to make reimaging easier (puppet certificates)
  # See late-command /var/www/html/preseeds/20.04/user-data on lannister

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
    command => '/usr/bin/nsupdate /etc/nsupdate',
    user    => 'root',
    minute  => 0,  # once per hour on minute 0
    require => File['/etc/nsupdate']
  }



}


