# == Class: apache
#
# Installs packages for Apache and sets config files.
#
class apache (
  $httpd_document_root = '/vagrant/www',
) {

  package { 'httpd-devel':
    allow_virtual => false,
    ensure => present;
  }

  service { 'httpd':
	enable  => true,
    ensure  => running,
    require => Package['httpd-devel'];
  }
  
  file { '/etc/httpd/conf/httpd.conf':
    content => template('apache/httpd.conf.erb'),
	notify => Service['httpd'];
  }
}
