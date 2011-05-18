class openstack::scheduler( $isServiceEnabled ) inherits openstack {
  package { "nova-scheduler":
    ensure => present,
    require => Package["python-greenlet"]
  }

  service { "nova-scheduler":
    ensure => $isServiceEnabled,
    require => Package["nova-scheduler"]
  }
}
