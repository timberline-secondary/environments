class hs_printers {

  file { 'printers.conf':
    path    => '/etc/cups/printers.conf',
    ensure  => file,
    source  => "puppet:///modules/hs_printers/printers.conf",
  }

}
