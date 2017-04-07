# == Class: pyvenv_tools
#
# This is a puppet module to install and configure pyvenv_tools.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { pyvenv_tools:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# st01tkh <st01tkh@gmail.com>
#
# === Copyright
#
# Copyright 2016 st01tkh
#
class pyvenv_tools ( $python_version = undef ){
  include pyvenv_tools::params
}
