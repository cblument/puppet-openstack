class openstack( $novaConfHash ) {

  $prePackages = ["python-software-properties", "python-mysqldb"]

  package { $prePackages: ensure => installed }

  package { "python-greenlet":
    ensure => present,
    require => Apt::Sources_list["nova_core_repo"]
  }

  package { ["nova-common", "nova-doc"]:
    ensure => present,
    require => Package["python-greenlet"]
  }

  file { "/etc/nova/nova.conf":
    ensure => present,
    content => template("openstack/nova.conf.erb"),
    require => Package["nova-common"]
  }
}
