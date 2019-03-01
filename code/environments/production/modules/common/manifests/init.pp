class common{ 

  package {
      ['git', 'vim', 'curl', 'munin-node']:
        ensure => latest;
        #require => Class['apt'],
        #notify => Service['apache2', 'mysql', 'memcached'];
  }

    file { 
        '/etc/hosts':
        mode => '0644',
        owner => root,
        group => root,
        source => "puppet:///modules/common/hosts";
    }

  user{
     "bs":
      ensure => present,
      gid => "bs",
      groups => ["sudo"],
      membership => minimum,
      shell => "/bin/bash",
      require => Group["bs"];
  }
   group { 
    "bs":
      ensure => present,
      gid => 1005;
  }

}
