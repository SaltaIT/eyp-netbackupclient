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
6. [Development](#development)
    * [Contributing](#contributing)

## Overview
Control of */usr/openv/netbackup/include_list* and */usr/openv/netbackup/exclude_list* files.

This documentation has reviewed up to version 0.1.15.

## Module Description
This module manages the following files:
- /usr/openv/netbackup/include_list
- /usr/openv/netbackup/exclude_list

## Setup

### What netbackupclient affects
- /usr/openv/netbackup/include_list
- /usr/openv/netbackup/exclude_list

### Setup Requirements
* pluginsync must be enabled.
* This module does **NOT** install netbackup

### Beginning with netbackupclient

Simple example:

```puppet
class { 'netbackupclient':
  includelist => [ '/var/', '/etc', '/var/spool/cron' ],
}

netbackupclient::excludelist { '/var/log': }
```

## Usage

### class netbackupclient
* **includelist**: array containing the elements to include.
* **excludelist**: array containing the elements to exclude.

### define netbackupclient::includedir
* **dir**: directory to include (must be absolute path)

## Reference
Facter:

* eyp_netbackupclient_excludelist, content of /usr/openv/netbackup/exclude_list, if netbackup client is installed.
* eyp_netbackupclient_includelist, content of /usr/openv/netbackup/include_list, if netbackup client is installed.
* eyp_netbackupclient_version, content of /usr/openv/netbackup/bin/version, if netbackup client is installed.

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
