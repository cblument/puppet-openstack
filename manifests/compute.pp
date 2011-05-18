class openstack::compute( $isServiceEnabled=false )  inherits openstack {

  package { "nova-compute":
    ensure => present,
    require => Package["python-greenlet"]
  }

  service { "nova-compute":
    ensure => $isServiceEnabled,
    require => Package["nova-compute"]
  }
}
