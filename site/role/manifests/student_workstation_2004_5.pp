# 
class role::student_workstation_2004_5 {
  # Each node should have only one role.
  # The role should include all profiles required to make it work.

  # All roles should include the base profile
  include profile::base

  include profile::desktop::base

  include profile::config::ldap_client
  include profile::config::auto_fs
  include profile::config::guest_user
  include profile::config::gnome
  include profile::config::upgrades
  include profile::config::restart_daily
  include profile::config::printers
  include profile::config::timezone
  include profile::config::wacom
  include profile::config::dns
  include profile::config::nvidia_drivers_470

  include profile::apps::blender
  include profile::apps::krita
  include profile::apps::cura
  include profile::apps::gimp
  include profile::apps::godot
  include profile::apps::inkscape
  include profile::apps::audio_suite
  include profile::apps::darktable
  include profile::apps::discord
  include profile::apps::ms_teams

  include profile::games::minecraft
  include profile::games::steam
  include profile::games::lutris
  include profile::games::tux_games

  include profile::multimedia::players_and_viewers
  include profile::multimedia::utils_and_codecs
  include profile::multimedia::screencaptures

  include profile::utils::browsers
  include profile::utils::network

  include profile::dev::python
  include profile::dev::vs_code

  include profile::dev::vim
  include profile::dev::arduino

}


