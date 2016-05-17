class openresty::params {
case $::osfamily{ 
   'redhat': {
    $prerequisites = [ 'readline-devel', 'pcre-dev', 'openssl-devel', 'gcc' ]
    $updater = 'yum update'	
   }
   'debian': {
  $prerequisites = [ 'libreadline-dev', 'libncurses5-dev', 'libpcre3-dev', 'libssl-dev', 'perl', 'make', 'build-essential' ]
  $updater = 'apt-get update'
  }
   default: {
     fail("Only redhat and debian are supported")
   }
}
}
