class role::test_workstation inherits role::student_workstation_2004_rtx2070 {
  #include profile::app_blender_netrender_service
  include profile::games::steam
}
