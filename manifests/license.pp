class cumulus::license {

  file {'/var/tmp/cumulus.lic':
    source => $cumulus::license_source
  }

  if $cumulus::license_notify_switchd {
    $notify = Service['switchd']
    service {'switchd':
      ensure => 'running'
    }
  } else {
    $notify = undef
  }

  cumulus_license { 'default':
    src => '/var/tmp/cumulus.lic',
    notify => $notify,
    require => File['/var/tmp/cumulus.lic'],
  }

}