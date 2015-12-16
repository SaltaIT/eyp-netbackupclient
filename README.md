# netbackupclient

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What netbackupclient affects](#what-netbackupclient-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with netbackupclient](#beginning-with-netbackupclient)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview
Control of <i>/usr/openv/netbackup/include_list</i> and <i>/usr/openv/netbackup/exclude_list</i> files.

## Module Description
This module fully manages the next files so this will overwrite your
existing files.
- /usr/openv/netbackup/include_list
- /usr/openv/netbackup/exclude_list

## Setup

### What netbackupclient affects
- /usr/openv/netbackup/include_list, will be overwrite.
- /usr/openv/netbackup/exclude_list, will be overwrite.

### Setup Requirements
* pluginsync must be enabled.
* NetBackup must be installed. Check this: <i>/usr/openv/netbackup/bin/version</i>.

### Beginning with netbackupclient
Simple example:
```puppet
class { 'netbackupclient':
  includelist => [ '/var/log', '/etc', '/var/spool/cron' ],
}

netbackupclient::excludelist { '/var/log': }
netbackupclient::excludelist { '/var/log': }
```

## Usage

### class netbackupclient
* includelist: array containing the elements to include.
* excludelist: array containing the elements to exclude.

### define netbackupclient::includedir
* dir: string which contains the directory to include.

## Reference
Facter:
* eyp_netbackupclient_excludelist, content of /usr/openv/netbackup/exclude_list, if netbackup client is installed.
* eyp_netbackupclient_includelist, content of /usr/openv/netbackup/include_list, if netbackup client is installed.
* eyp_netbackupclient_version, content of /usr/openv/netbackup/bin/version, if netbackup client is installed.

## Limitations
* Redhat and derivatives: 6 and 7 releases.
* Ubuntu: 14.
* Others: unsuported.
