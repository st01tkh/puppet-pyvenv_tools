define pyvenv_tools::pyvenv() {
  case $facts['kernel'] {
    'Linux' : {
      case $facts['os']['family'] {
        'RedHat', 'Amazon' : {
          ensure_packages(['python3-venv'], { 'ensure' => 'present', })
        }
        'Debian', 'Ubuntu' : {
          ensure_packages(['python3-venv'], { 'ensure' => 'present', })
        }
        default: {
          fail ("unsupported distribution ${$facts['os']['family']}")
        }
      }
    }
    default : {
      fail ("unsupported platform ${$facts['os']['name']}")
    }
  }
}
