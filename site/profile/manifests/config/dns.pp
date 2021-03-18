class profile::config::dns {
  # update delete %fqdn% A
  # update add %fqdn% 86400 A %ip%
  # send 
  # file { '/etc/nsupdate':
  #     ensure  => 'present',
  #     content => template('dnsupdate/nsupdate.erb')
  # }
  # exec { 'nsupdate':
  #   path     => ['/bin', '/usr/bin'],
  #   command  => 'nsupdate /etc/nsupdate',
  #   provider => 'shell',
  #   require  => File['/etc/nsupdate'],
  # }
}

# update delete <%= @fqdn %> A
# update add <%= @fqdn %> 1140  A <%= @ipaddress %>
# send
# update add <%= @ipaddress.split(".").reverse.join('.') %>.in-addr.arpa 1200 IN PTR <%= @fqdn %>.
# send
