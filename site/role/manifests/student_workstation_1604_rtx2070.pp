# 
class role::student_workstation_1604_rtx2070 {
  # Each node should have only one role.
  # The role should include all profiles required to make it work.

  # All roles should include the base profile
  include profile::base

  include profile::config_ldap_client
  include profile::config::upgrades
  include profile::config_restart_daily
  include profile::config_printers

  include profile::config::nvidia_rtx2070

  include profile::app_blender
  #include profile::app_blender_netrender_service
  include profile::app_krita
  include profile::app_gimp
  include profile::apps::cura
  include profile::app_audio_suite
  include profile::app_games
  include profile::app_darktable
  # include profile::app_steam

  include profile::utils_multimedia
  include profile::utils_browsers
  include profile::utils_misc
  include profile::utils_gnome
  include profile::utils_screencast
  include profile::utils_desktops
  include profile::utils_discord
  include profile::utils_fonts
  include profile::utils_play_on_linux

  include profile::admin_ssh

  include profile::dev_java
  include profile::dev_python
  include profile::dev_general_utils
  include profile::dev_git_desktop
  include profile::dev_godot
  include profile::dev::vs_code
  # include profile::dev::processsing

}


