# == Class: pyvenv_tools::params
#
# OS-dependent parameters for vagrant module.
#
class pyvenv_tools::params {
  $pyvenv_search_pattern = 'pyvenv-*'
  $pyvenv_source_path = $::osfamily ? {
    'windows' => undef,
    default   => '/usr/bin/pyvenv'
  }
  $pyvenv_target_path = undef
}
