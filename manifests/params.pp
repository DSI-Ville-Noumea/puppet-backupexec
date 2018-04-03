# Class backupexec::params
#
# set distribution specific variables
#
class backupexec::params {
  case $::osfamily {
    'RedHat': {
      $pkgname = 'VRTSralus'
      $password = indef
    }
    default: {
      fail ("Your OS : ${::operatingsystem} is not supported.")
    }
  }
}
