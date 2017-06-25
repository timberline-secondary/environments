class hs_printers {


  file { '/etc/cups/client.conf':
    content  => "ServerName hightower",
    ensure  => file,
  }

  # Back up in case CUPS server is unavailable... don't know if this will work or not.
  file { 'printers.conf':
    path    => '/etc/cups/printers.conf',
    source  => "puppet:///modules/hs_printers/printers.conf",
    ensure  => file,
  }
}
