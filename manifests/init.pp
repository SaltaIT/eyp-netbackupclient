class netbackupclient (
			$includelist=[ '/var/log', '/etc', '/var/spool/cron' ],
			$excludelist=[ '/', '/dev', '/sys', '/proc' ],
			) inherits netbackupclient::params {

	validate_array($includelist)
	validate_array($excludelist)

	if ($::eyp_netbackupclient_version)
	{
		concat { '/usr/openv/netbackup/include_list':
			ensure => present,
			owner => "root",
			group => "root",
			mode => 0644,
		}

		concat::fragment{ 'default_include':
			target  => '/usr/openv/netbackup/include_list',
			content => template("netbackupclient/default_include.erb"),
			order   => '01',
		}

		concat { '/usr/openv/netbackup/exclude_list':
			ensure => present,
			owner => "root",
			group => "root",
			mode => 0644,
		}

		concat::fragment{ 'default_exclude':
			target  => '/usr/openv/netbackup/exclude_list',
			content => template("netbackupclient/default_exclude.erb"),
			order   => '01',
		}
	}

}
