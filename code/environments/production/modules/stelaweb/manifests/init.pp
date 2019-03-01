class stelaweb{ 

  package {
    ['php5', 'php5-mysql', 'php5-gd']:
      ensure => installed,
      #require => Class['apt'],
      notify => Service['apache2'];
  }
    
  service {
    'apache2':
      ensure => true,
      enable => true;
#    'mysql':
#      ensure => true,
#      enable => true;
  }

  tidy { 
    'prune_cached_pdf':
      path    => '/var/www/html/stela/public/pdf/',
      age     => '1m',
      recurse => 1;

    'prune_cached_barcodes':
      path    => '/var/www/html/stela/public/barcodes/',
      age     => '1m',
      recurse => 1;
  }

  file { 
    '/var/www/html/stela/public/pdf':
      path => '/var/www/html/stela/public/pdf',
      ensure => "directory",
      owner  => bs,
      group  => bs,
      mode   => "0777";

    '/var/www/html/stela/public/barcodes':
      path => '/var/www/html/stela/public/barcodes',
      ensure => "directory",
      owner  => bs,
      group  => bs,
      mode   => "0777";
#
#    '/home/pi/.aws/config':
#      mode => '0644',
#      owner => pi,
#      group => pi,
#      require => File['/home/pi/.aws'],
#      source => "puppet:///modules/stelaweb/aws_config";
#
#    '/home/pi/.aws/credentials':
#      mode => '0644',
#      owner => pi,
#      group => pi,
#      require => File['/home/pi/.aws'],
#      source => "puppet:///modules/stelaweb/aws_credentials";
  }

}
