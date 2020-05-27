
class profile::utils::reboot_after_run {

  reboot { 'after_run':
    apply   => finished,
  }
