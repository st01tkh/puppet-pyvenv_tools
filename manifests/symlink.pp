define pyvenv_tools::symlink(
  $search_pattern = undef,
  $source_path = undef,
  $target_path = undef
) {
  case $::osfamily {
    'windows': { fail("$::osfamily is not supported yet.") }
  }

  include pyvenv_tools::params

  if ( $search_pattern == undef ) {
    $_search_pattern = $pyvenv_tools::params::pyvenv_search_pattern
  } else {
    $_search_pattern = $search_pattern
  }

  if ( $source_path == undef ) {
    $_source_path = $pyvenv_tools::params::pyvenv_source_path
  } else {
    $_source_path = $source_path
  }
  if ( $_source_path == undef ) {
    fail("pyvenv's source_path is not defined")
  }

  if ( $target_path == undef ) {
    $_target_path = $pyvenv_tools::params::pyvenv_target_path
  } else {
    $_target_path = $target_path
  }
  if ( $_target_path == undef ) {
    $ar = find_files_in_path_dirs($_search_pattern)
    if ($ar and !empty($ar) and validate_absolute_path($ar[0])) {
      $__target_path = $ar[0]
    } else {
      $__target_path = undef
    }
  } else {
    $__target_path = $_target_path
  }
  if ( $__target_path == undef ) {
    fail("pyvenv's target neither found nor defined")
  }

  if (!exists($_source_path)) {
    file { "ensure_pyvenv_symlink_default":
      path => "$_source_path", ensure => link , target => "$__target_path"
    }
  }
}
