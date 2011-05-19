class openstack::objectstore( $isServiceEnabled=false ) inherits openstack {
  package { "nova-objectstore":
    ensure => present,
    require => Package["python-greenlet"]
  }

  service { "nova-objectstore":
    ensure => $isServiceEnabled,
    require => Package["nova-objectstore"],
    subscribe => File["/etc/nova/nova.conf"]
  }
}
