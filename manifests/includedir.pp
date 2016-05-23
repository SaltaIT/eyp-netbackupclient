define netbackupclient::includedir ($dir=$name) {
  if ($::eyp_netbackupclient_version)
  {
    concat::fragment{ "include_${dir}":
      target  => '/usr/openv/netbackup/include_list',
      content => "${dir}\n",
    }
  }

}
