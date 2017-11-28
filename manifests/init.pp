# Class backupexec
#
# This class installs and configures a Symantec BackupExec agent on Linux
# test

class backupexec (
    $pkgname = $backupexec::params::pkgname,
) inherits backupexec::params {
  # group { 'beoper':
  #   ensure => present,
  # }
  # user { 'beuser':
  #   ensure    => present,
  #   gid       => '0',
  #   groups    => 'beoper',
  #   require   => Group['beoper'],
  #   passsword => $::beoper_pwd,
  # }

  create_resources(user_mgt, hiera('backupexec::init::user_beoper'))

  package { $pkgname:
    ensure  => present,
    require => User['beoper'],
  }

  file { '/etc/VRTSralus/ralus.cfg':
    ensure  => file,
    owner   => 'beoper',
    group   => 'beoper',
    mode    => '0644',
    content => template('backupexec/ralus.cfg.erb'),
    require => Package[$backupexec::params::pkgname],
  }

  file { '/etc/init.d/VRTSralus.init':
    ensure => 'link',
    target => '/opt/VRTSralus/bin/VRTSralus.init',
    before => Service['VRTSralus.init'],
  }

#  service { 'VRTSralus.init':
#    ensure     => running,
#    enable     => true,
#    hasstatus  => false,
#    hasrestart => true,
#    pattern    => '/opt/VRTSralus/bin/beremote',
#    require    => Package[$backupexec::params::pkgname],
#  }

  file { '/opt/VRTSralus/data':
    ensure  => 'directory',
    owner   => 'beoper',
    group   => 'beoper',
    mode    => '0770',
    require => Package[$backupexec::params::pkgname],
  }
  
  firewall { 'agentBE': 
    #chain  => 'ETH0-INPUT',
    source => '172.16.4.80',
    state  => ['NEW'],
    proto  => 'tcp',
    dport  => '1024-65535',
    action => 'accept',  
  }
}
