class hs_printers {

  #Overwrites color printer for teachers.  
  #Need to figure out how to add color printer to teacher machine without adding to student machine>
  # file { 'printers.conf':
  #   path    => '/etc/cups/printers.conf',
  #   ensure  => absent,
  #   source  => "puppet:///modules/hs_printers/printers.conf",
  # }

  include '::cups'

  

}
