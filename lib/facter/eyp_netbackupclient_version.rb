#cat /usr/openv/netbackup/bin/version
if File.exist?('/usr/openv/netbackup/bin/version')
  Facter.add("eyp_netbackupclient_version") do
      setcode do
          Facter::Util::Resolution.exec('cat /usr/openv/netbackup/bin/version 2>/dev/null')
      end
  end
end
