class netbackupclient (
                        $includelist    = [ '/var/log', '/etc', '/var/spool/cron' ],
                        $excludelist    = [ '/', '/dev', '/sys', '/proc' ],
                        $package_ensure = 'present',
                      ) inherits netbackupclient::params {

  validate_array($includelist)
  validate_array($excludelist)

  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  if($package_ensure!=undef)
  {
    validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

    case $package_ensure
    {
      'absent':
      {
        exec { 'eyp-netbackup rpm -e':
          command => 'rpm -e netbackup',
          onlyif  => 'rpm -qi netbackup',
        }

        $nb_config_ensure='present'
      }
      'present':
      {
        $nb_config_ensure='present'
      }
      default:
      {
        fail("package_ensure ${package_ensure} - currently unimplemented")
      }
    }
  }

  if ($::eyp_netbackupclient_version)
  {
    concat { '/usr/openv/netbackup/include_list':
      ensure => $nb_config_ensure,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }

    concat::fragment{ 'default_include':
      target  => '/usr/openv/netbackup/include_list',
      content => template("${module_name}/default_include.erb"),
      order   => '01',
    }

    concat { '/usr/openv/netbackup/exclude_list':
      ensure => $nb_config_ensure,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }

    concat::fragment{ 'default_exclude':
      target  => '/usr/openv/netbackup/exclude_list',
      content => template("${module_name}/default_exclude.erb"),
      order   => '01',
    }
  }

}
