class cumulus::puppet {

  file_line {
    'cumulusfix':
      path => '/usr/lib/ruby/vendor_ruby/puppet/provider/package/apt.rb',
      line => '  defaultfor :operatingsystem => [:debian, :ubuntu, :cumuluslinux]',
      match => '  defaultfor :operatingsystem.*$',
      notify => Service['puppet'];
  }

}