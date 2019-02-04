class stelaweb{ 

  package {
    ['git', 'ntpdate', 'vim', 'mysql-client', 'apache2', 'curl', 'php7.0', 'php7.0-mysql', 'mysql-server', 'munin-node']:
      ensure => latest,
      #require => Class['apt'],
      notify => Service['apache2', 'mysql'];
  }
    
  service {
    'apache2':
      ensure => true,
      enable => true;
    'mysql':
      ensure => true,
      enable => true;
  }

  tidy { 'prune_cached_pdf':
    path    => '/var/www/html/stela/public/pdf/',
    age     => '1m',
    recurse => 1,
  }

}
