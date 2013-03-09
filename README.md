# Caffeine Puppet Module for Boxen

Install a customize [Caffeine](http://lightheadsw.com/caffeine), insomnia for your Mac.

This module will enable by default the following:

* Automatically start Caffeine at login
* Caffeine enabled by default
* Default duration is set as 'Indefinitly'
* Disable welcome message

## Usage

```puppet
include caffeine
```

## Required Puppet Modules

* `boxen`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
