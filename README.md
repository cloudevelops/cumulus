# cumulus

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with cumulus](#setup)
    * [What cumulus affects](#what-cumulus-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
6. [Release notes](#release-notes)

## Overview

This module automates Cumulus Linux switch configuration to be convenient and Hiera friendly.
Simple and convenient to use, wrapping up the basic things and example fragments to actually 
configure a real switch.
Tested with Cumulus Linux 2.5.2

## Module Description

Module is wrapper for basic Cumulus modules [cumulus_interface](https://github.com/CumulusNetworks/cumulus-cl-interfaces-puppet) and [cumulus_license](https://github.com/CumulusNetworks/cumulus-cl-license-puppet).
It deploys various small patches and enables management of switch directly via hiera.

## Setup

### What cumulus affects

* Adds required include into /etc/network/interfaces
* Optionally deploys patch for Puppet apt provider not to conflict with Sensu module
* Optionally deletes default user password
* Optionally installs license
* Optionally installs debian repo for more packages
* Provides hiera resources for cumulus_interface, cumulus_bond and cumulus_bridge

### Setup Requirements

* Make sure dependent modules are installed

## Usage

### Basic usage

```
class { 'cumulus':
  license_source => 'puppet:///modules/cloudinfrastack/profile/sw/cumulus.lic',
  puppet_patch => true,
  remove_cumulus_password => true,
  install_debian_repo => true,
  interface => {
    eth0 => {
      ipv4 => ['10.30.1.1/24']
    },
    swp1 => {}
  }
}

```

### Full example with hiera

Include the module

```
include cumulus
```

Setup Hiera data

```
{
  "cumulus::license_source": "puppet:///modules/cloudinfrastack/profile/sw/cumulus.lic",
  "remove_cumulus_password": true,
  "install_debian_repo": true,
  "cumulus::interface": {
    "eth0": {
      "ipv4": ["10.30.1.1/24"]
    },
    "swp1": {},
    "swp2": {},
    "swp3": {},
    "swp4": {},
    "swp5": {},
    "swp6": {},
    "swp7": {},
    "swp8": {},
    "swp9": {},
    "swp10": {},
    "swp11": {},
    "swp12": {},
    "swp13": {},
    "swp14": {},
    "swp15": {},
    "swp16": {},
    "swp17": {},
    "swp18": {},
    "swp19": {},
    "swp20": {},
    "swp21": {},
    "swp22": {},
    "swp23": {},
    "swp24": {},
    "swp25": {},
    "swp26": {},
    "swp27": {},
    "swp28": {},
    "swp29": {},
    "swp30": {},
    "swp31": {},
    "swp32": {},
    "swp33": {},
    "swp34": {},
    "swp35": {},
    "swp36": {},
    "swp37": {},
    "swp38": {},
    "swp39": {},
    "swp40": {},
    "swp41": {},
    "swp42": {},
    "swp43": {},
    "swp44": {},
    "swp45": {},
    "swp46": {},
    "swp47": {},
    "swp48": {},
    "swp49": {},
    "swp50": {},
    "swp51": {},
    "swp52": {},
    "swp53": {},
    "swp54": {}
  },
  "cumulus::bond": {
    "bond1": {
      "slaves": ["swp1-2"]
    },
    "bond2": {
      "slaves": ["swp3-4"]
    },
    "bond3": {
      "slaves": ["swp5-6"]
    },
    "bond4": {
      "slaves": ["swp7-8"]
    },
    "bond5": {
      "slaves": ["swp9-10"]
    },
    "bond6": {
      "slaves": ["swp11-12"]
    },
    "bond7": {
      "slaves": ["swp13-14"]
    },
    "bond8": {
      "slaves": ["swp15-16"]
    },
    "bond9": {
      "slaves": ["swp17-18"]
    },
    "bond10": {
      "slaves": ["swp19-20"]
    },
    "bond11": {
      "slaves": ["swp21-22"]
    },
    "bond12": {
      "slaves": ["swp23-24"]
    },
    "bond13": {
      "slaves": ["swp25-26"]
    },
    "bond14": {
      "slaves": ["swp27-28"]
    },
    "bond15": {
      "slaves": ["swp29-30"]
    },
    "bond16": {
      "slaves": ["swp31-32"]
    },
    "bond17": {
      "slaves": ["swp33-34"]
    },
    "bond18": {
      "slaves": ["swp35-36"]
    },
    "bond19": {
      "slaves": ["swp37-38"]
    },
    "bond20": {
      "slaves": ["swp39-40"]
    },
    "bond21": {
      "slaves": ["swp41-42"]
    },
    "bond22": {
      "slaves": ["swp43-44"]
    },
    "bond23": {
      "slaves": ["swp45-46"]
    }
  },
  "cumulus::bridge": {
    "br802": {
      "ports": ["bond6.802", "swp48.802"]
    }
  }
}
```

## Limitations

Not known :)

## Development

Feel free to contribute and improve.

## Release Notes

This is first release and serves as implementation example.
