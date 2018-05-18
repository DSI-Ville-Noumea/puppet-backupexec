# Class backupexec
#
# This class installs and configures a Symantec BackupExec agent on Linux
# test

class backupexec (
    $pkgname = $backupexec::params::pkgname,
    $password = $backupexec::params::password,
) inherits backupexec::params {
   group { 'beoper':
     ensure => present,
   }
   user { 'beuser':
     ensure     => present,
     gid        => '0',
     groups     => 'beoper',
     managehome => true,
     require    => Group['beoper'],
     password   => $password,
   }

  package { $pkgname:
    ensure  => latest,
    require => User['beuser'],
  }
  
  file { '/etc/VRTSralus/ralus.cfg':
    ensure  => file,
    owner   => 'beuser',
    group   => 'beoper',
    mode    => '0644',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\\Symantec\\Backup Exec For Windows\\Agent Browser\\TcpIp\\AdvertisementPort' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Agent Browser\\TcpIp\\AdvertisementPort=6101',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Agent\ Browser\\TcpIp\\AdvertisementPort\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Debug\\AgentConfig' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Debug\\AgentConfig=0',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Debug\\AgentConfig\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Debug\VXBSAlevel' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Debug\\VXBSAlevel=',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Debug\\VXBSAlevel\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\Agents\Advertise All' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\Agents\\Advertise All=1',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\Agents\\Advertise\ All\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\Agents\Advertise Now' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\Agents\\Advertise Now=0',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\Agents\\Advertise\ Now\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\Agents\Advertisement Purge' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\Agents\\Advertisement Purge=0',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\Agents\\Advertisement\ Purge\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\Agents\Advertising Disabled' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\Agents\\Advertising Disabled=0',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\Agents\\Advertising\ Disabled\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\Agents\Advertising Interval Minutes' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\Agents\\Advertising Interval Minutes=240',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\Agents\\Advertising\ Interval\ Minutes\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\Agents\Agent Directory List_1' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\Agents\\Agent Directory List_1=sppsbe0.site-mairie.noumea.nc',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\Agents\\Agent\ Directory\ List_1\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\Agents\Agent Directory List_2' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\Agents\\Agent Directory List_2=172.16.4.80',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\Agents\\Agent\ Directory\ List_2\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\Agents\Agent Directory List_3' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\Agents\\Agent Directory List_3=sppsbe0',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\Agents\\Agent\ Directory\ List_3\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\Agents\Auto Discovery Enabled' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\Agents\\Auto Discovery Enabled=1',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\Agents\\Auto\ Discovery\ Enabled\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\Logging\RANT NDMP Debug Level' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\Logging\\RANT NDMP Debug Level=0',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\Logging\\RANT\ NDMP\ Debug\ Level\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\RALUS\DisableOFO' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\RALUS\\DisableOFO=0',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\RALUS\\DisableOFO\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\RALUS\Encoder' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\RALUS\\Encoder=',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\RALUS\\Encoder\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\RALUS\ShowTSAFS' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\RALUS\\ShowTSAFS=',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\RALUS\\ShowTSAFS\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\RALUS\VfmPath' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\RALUS\\VfmPath=/opt/VRTSralus/VRTSvxms',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\RALUS\\VfmPath\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Engine\RMAL\DisableRMAL' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\RMAL\\DisableRMAL=0',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\RMAL\\DisableRMAL\=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\Network\TcpIp\DnsQueryTimeOut' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Network\\TcpIp\\DnsQueryTimeOut=5000',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Network\\TcpIp\\DnsQueryTimeOut=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\\Engine\RALUS\SystemExclude1' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\RALUS\\SystemExclude1=/dev/*.*',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\RALUS\\SystemExclude1=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\\Engine\RALUS\SystemExclude2' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\RALUS\\SystemExclude2=/proc/*.*',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\RALUS\\SystemExclude2=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  file_line { 'Software\Symantec\Backup Exec For Windows\Backup Exec\\Engine\RALUS\SystemExclude3' :
    ensure => present,
    path   => '/etc/VRTSralus/ralus.cfg',
    line   => 'Software\\Symantec\\Backup Exec For Windows\\Backup Exec\\Engine\\RALUS\\SystemExclude3=/sys/*.*',
    match  => '^Software\\Symantec\\Backup\ Exec\ For\ Windows\\Backup\ Exec\\Engine\\RALUS\\SystemExclude3=',
    require => Package[$backupexec::params::pkgname],
    notify  => Service['VRTSralus.init'],
  }
  
  #file { '/etc/VRTSralus/ralus.cfg':
  #  ensure  => file,
  #  owner   => 'beuser',
  #  group   => 'beoper',
  #  mode    => '0644',
  #  content => template('backupexec/ralus.cfg.erb'),
  #  require => Package[$backupexec::params::pkgname],
  #  notify  => Service['VRTSralus.init'],
  #}

  file { '/etc/init.d/VRTSralus.init':
    ensure => 'link',
    target => '/opt/VRTSralus/bin/VRTSralus.init',
    before => Service['VRTSralus.init'],
  }

  service { 'VRTSralus.init':
    ensure     => running,
    enable     => true,
    hasstatus  => false,
    hasrestart => true,
    pattern    => '/opt/VRTSralus/bin/beremote',
    require    => Package[$backupexec::params::pkgname],
  }

  file { '/opt/VRTSralus/data':
    ensure  => 'directory',
    owner   => 'beuser',
    group   => 'beoper',
    mode    => '0770',
    require => Package[$backupexec::params::pkgname],
  }
}
