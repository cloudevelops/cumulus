# == Class: cumulus
#
# Cumulus Linux switch simple management.
#
# === Parameters
#
# [*license_source*]
#   Optional. Puppet source of license file.
#
# [*license_notify_switchd*]
#   Default "false". Notify switchd after license install.
#
# [*interface_include*]
#   Default "true". Add include line to /etc/network/interfaces, so
#   /etc/network/interfaces.d/* files will be loaded by ifup.
#
# [*puppet_patch*]
#   Default "false". Patch puppet apt provider to be default for Cumulus Linux.
#   Required if you use Sensu Puppet module.
#
# [*remove_cumulus_password*]
#   Default "false". Remove default cumulus user password.
#
# [*install_debian_repo*]
#   Default "false". Install debian repo to enable more packages.
#
# [*interface*]
#   Default {}. Hash of cumulus_interface provider resources.
#
# [*bond*]
#   Default {}. Hash of cumulus_bond provider resources.
#
# [*bridge*]
#   Default {}. Hash of cumulus_bridge provider resources.
#
# === Examples
#
# Basic usage
#
#  class { 'cumulus':
#    license_source => 'puppet:///modules/cloudinfrastack/profile/sw/cumulus.lic',
#    puppet_patch => true,
#    remove_cumulus_password => true,
#    install_debian_repo => true,
#    interface => {
#      eth0 => {
#        ipv4 => ['10.30.1.1/24']
#      },
#      swp1 => {}
#    }
#  }
#
# === Authors
#
# Author Name <zdenek.janda@cloudevelops.com>
#
# === Copyright
#
# Copyright 2015 Zdenek Janda.
#
class cumulus (
  $license_source          = undef,
  $license_notify_switchd  = $cumulus::params::license_notify_switchd,
  $interface_include       = $cumulus::params::interface_include,
  $puppet_patch            = $cumulus::params::puppet_patch,
  $remove_cumulus_password = $cumulus::params::remove_cumulus_password,
  $install_debian_repo     = $cumulus::params::install_debian_repo,
  $interface               = {},
  $bond                    = {},
  $bridge                  = {},
) inherits cumulus::params {

  include cumulus::system
  include cumulus::package

  if $puppet_patch {
    include cumulus::puppet
  }

  if $remove_cumulus_password {
    include cumulus::user
  }

  if $install_debian_repo {
    include cumulus::repository
  }

  if $license_source {
    include cumulus::license
  }

  create_resources('cumulus_interface',$interface)
  create_resources('cumulus_bond',$bond)
  create_resources('cumulus_bridge',$bridge)

}
