# Public: Install Caffeine.app to /Applications.
#
# Examples
#
#   include caffeine
class caffeine {

  $user = "/Users/${hostname}"

  package { 'Caffeine':
    provider => 'compressed_app',
    source   => 'http://lightheadsw.com/files/releases/com.lightheadsw.Caffeine/Caffeine1.1.1.zip'
  }

  file { 'caffeine_config':
    path => "${user}/Library/Preferences/com.lightheadsw.caffeine.plist",
    content => template('caffeine/com.lightheadsw.caffeine.plist.erb'),
    require => Package['boxen/caffeine']
  }
}
