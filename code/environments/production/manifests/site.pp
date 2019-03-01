file { '/tmp/testfile':
ensure   => present,
mode     => '0444',
content  => 'test content',
}

node /^reception\d+$/{
  include common
}

node /^stela$/{
  include common
  include stelaweb
}

node /^raspberrypi$/ {
    include stelaweb
    include reception
    #include common
}
