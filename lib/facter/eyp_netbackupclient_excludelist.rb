
Facter.add("eyp_netbackupclient_excludelist") do
    setcode do
        Facter::Util::Resolution.exec('bash -c \'if [ -f "/usr/openv/netbackup/include_list" ]; then for i in $(cat /usr/openv/netbackup/exclude_list); do echo -en "$i,"; done | sed \'s/,$//\'; fi\'')
    end
end

