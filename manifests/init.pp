class openresty (
$prerequisites = $openresty::params::prerequisites,
$updater =  $openresty::params::updater
)inherits openresty::params{

#pre-requisite packages for installing openresty

package { $prerequisites: ensure => 'installed',
          require => Exec[$updater],
        }

exec { 'apt-get update':
        command => "/usr/bin/apt-get update",
}
exec { 'yum update':
       command => "/usr/bin/yum -y -q update",

}

file {
        'openresty-1.9.7.4.tar.gz':
        ensure => 'file',
        path  => '/tmp/openresty-1.9.7.4.tar.gz',
        owner => 'root',
        group => 'root',
        mode  =>  '0644',
        source => 'puppet:///modules/openresty/openresty-1.9.7.4.tar.gz',
        }

file {
      'OpenrestyInstaller.sh':
      ensure => 'file',
      path => '/tmp/OpenrestyInstaller.sh',
      owner => 'root',
      group => 'root',
      mode  => '0744',
      notify => Exec['install_openresty'],
      source => 'puppet:///modules/openresty/OpenrestyInstaller.sh',
}

exec {
        'install_openresty':
        command => '/tmp/OpenrestyInstaller.sh',
        refreshonly => true,
}

}

