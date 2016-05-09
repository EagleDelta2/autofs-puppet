# = Class: autofs::install
#
# This class ensures that autofs is installed.
#
class autofs::package {
  Package {
    ensure => installed
  }
  case $::osfamily {
    'Debian', 'Ubuntu': {
      package { ['autofs', 'nfs-common']: }
    }
    'RedHat', 'CentOS': {
      package { ['autofs', 'nfs-utils']: }
    }
    'Solaris': {
      # Solaris includes autofs
      # Block to prevent failures
    }
    default: {
      fail("${::operatingsystem} not supported.")
    }
  }
}
