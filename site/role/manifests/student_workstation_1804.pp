# 
class role::student_workstation_1804 {
  # Each node should have only one role.
  # The role should include all profiles required to make it work.

  # All roles should include the base profile
  include profile::base

  include profile::config::ldap_client
  include profile::config::auto_fs
  include profile::config::upgrades


}
