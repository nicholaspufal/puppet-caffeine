# Public: Install Caffeine.app to /Applications.
#
# Examples
#
#   include caffeine
class caffeine {
  $user_folder = "/Users/${::boxen_user}"

  package { 'Caffeine':
    provider => 'compressed_app',
    source   => 'http://lightheadsw.com/files/releases/com.lightheadsw.Caffeine/Caffeine1.1.1.zip'
  }

  file { 'config caffeine':
    path => "${user_folder}/Library/Preferences/com.lightheadsw.caffeine.plist",
    content => template('caffeine/com.lightheadsw.caffeine.plist.erb'),
    require => Package['Caffeine']
  }

  exec { 'launch caffeine':
    command     => '/usr/bin/open /Applications/Caffeine.app',
    refreshonly => true,
    subscribe   => File['config caffeine']
  }
}
