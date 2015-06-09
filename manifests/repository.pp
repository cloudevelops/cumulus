class cumulus::repository {

  apt::source { 'wheezy':
    ensure      => present,
    location    => 'http://http.us.debian.org/debian',
    release     => 'wheezy',
    repos       => 'main',
  }

  apt::source { 'wheezy-updates':
    ensure      => present,
    location    => 'http://security.debian.org/',
    release     => 'wheezy/updates',
    repos       => 'main',
  }

}