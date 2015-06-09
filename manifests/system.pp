class cumulus::system {

  file_line {
    'source_interfaces':
      path => '/etc/network/interfaces',
      line => 'source /etc/network/interfaces.d/*',
  }

}