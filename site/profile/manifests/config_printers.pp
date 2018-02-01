class profile::config_printers {

  include '::cups'

  # Using a suitable model from the output of the command lpinfo -m on the node
  cups_queue { 'Hackerspace_BW_LexmarkT644':
    ensure => 'printer',
    model  => 'foomatic-db-compressed-ppds:0/ppd/foomatic-ppd/Lexmark-T644-Postscript.ppd',
    uri    => 'socket://192.168.43.101', # Replace with your printer's URI
    accepting => true,
    enabled   => true,
    options => {
      'Duplex'   => 'DuplexNoTumble',
    }
  }

}