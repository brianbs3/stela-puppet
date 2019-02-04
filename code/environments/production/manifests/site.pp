file { '/tmp/testfile':
ensure   => present,
mode     => '0444',
content  => 'test content',
}

node /^reception\d+$/{
  include common
}
