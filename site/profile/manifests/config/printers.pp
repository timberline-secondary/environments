#
class profile::config::printers {

  class { '::cups':
    # remove all queues from the node which do not match a cups_queue resource in the current catalog
    # Actually, this just seems to cause errors, and we've reimaged the lab so no stray printers are left anyway.
    # purge_unmanaged_queues => true,
  }

  ###
  # With CUPS installed, computers should be getting printer from Hightower (cups server):
  # http://hightower:631/printers/
  #


  # # Using a suitable model from the output of the command lpinfo -m on the node
  # cups_queue { 'Hackerspace_BW_Printer_LexmarkT644':
  #   ensure    => 'printer',
  #   model     => 'foomatic-db-compressed-ppds:0/ppd/foomatic-ppd/Lexmark-T644-Postscript.ppd',
  #   uri       => 'socket://192.168.43.101', # Replace with your printer's URI
  #   accepting => true,
  #   enabled   => true,
  #   options   => {
  #     'Duplex'   => 'DuplexNoTumble',
  #   }
  # }

  # Using a suitable model from the output of the command lpinfo -m on the node
  # cups_queue { 'Hackerspace_Color_Printer_HPColorLaserJet5550':
  #   ensure    => 'printer',
  #   model     => 'foomatic-db-compressed-ppds:0/ppd/foomatic-ppd/Lexmark-T644-Postscript.ppd',
  #   uri       => 'socket://10.12.3.23', # Replace with your printer's URI
  #   accepting => true,
  #   enabled   => true,
  #   options   => {
  #     'Duplex'   => 'DuplexNoTumble',
  #   },
  #   access    => {
  #     'policy' => 'allow',
  #     'users'  => ['@teacher', '@colorprinter'],
  #   }
  # }



}
