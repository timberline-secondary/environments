class role::test_workstation {
  # Each node should have only one role.
  # The role should include all profiles required to make it work.

  # All roles should include the base profile
  include profile::base

  include profile::config_ldap_client

  include profile::app_blender
  include profile::app_krita
  include profile::app_gimp
  include profile::app_cura
  include profile::app_audio_suite

  include profile::utils_multimedia
  include profile::utils_browsers
  include profile::utils_misc
  include profile::utils_gnome
  include profile::utils_screencast

  include profile::admin_ssh



}
