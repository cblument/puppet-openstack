class openstack::network( $isServiceEnabled=false ) inherits openstack {
  package { "nova-network":
    ensure => present,
    require => Package["python-greenlet"]
  }

  service { "nova-network":
    ensure => $isServiceEnabled,
    require => Package["nova-network"],
    subscribe => File["/etc/nova/nova.conf"]
  }
}
