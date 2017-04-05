class hs_printers {

  #Overwrites color printer for teachers.  
  #Need to figure out how to add color printer to teacher machine without adding to student machine>
  # file { 'printers.conf':
  #   path    => '/etc/cups/printers.conf',
  #   ensure  => absent,
  #   source  => "puppet:///modules/hs_printers/printers.conf",
  # }

  # https://forge.puppet.com/leoarnold/cups#option-defaults
  include '::cups'

  cups_queue { 'HackerspacePrinter':
    ensure => 'absent',
    model  => 'foomatic-db-compressed-ppds:0/ppd/foomatic-ppd/Lexmark-T644-Postscript.ppd',
    uri    => 'ipp://192.168.43.101', # Replace with your printer's URI
    accepting => true,
    enabled => true,

  }


  # https://lauri.võsandi.com/cfgmgmt/puppet-cups.html
  # Install CUPS and filters
  # package { "system-config-printer-gnome": ensure => installed }
  # package { "cups": ensure => installed }
  # package { "ghostscript": ensure => installed }
  # package { "unpaper": ensure => installed }
  # package { "printer-driver-all": ensure => installed }
  #
  # # PPD-s
  # package { "openprinting-ppds": ensure => installed }
  # package { "hpijs-ppds": ensure => installed }
  # package { "hp-ppd": ensure => installed }
  # package { "foomatic-db-compressed-ppds": ensure => installed }
  

}
