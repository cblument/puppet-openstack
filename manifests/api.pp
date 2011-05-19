class openstack::api($isServiceEnabled=false) inherits openstack {
  package { "nova-api":
    ensure => present,
    require => Package["python-greenlet"]
  }
  service { "nova-api":
    ensure => $isServiceEnabled,
    require => Package["nova-api"],
    subscribe => File["/etc/nova/nova.conf"]
  }
}
