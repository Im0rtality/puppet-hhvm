#
# This module manages hhvm packages.
class hhvm::config inherits hhvm::params {
          
    file { "/var/log/hhvm":
        ensure => "directory",
        owner => $hhvm_user,
        group => $hhvm_user
    }
    
    file { "/var/run/hhvm":
        ensure => "directory",
        owner => $hhvm_user,
        group => $hhvm_user
    }
          
    file { "/etc/hhvm":
        ensure => "directory",
    }
          
    file { '/etc/default/hhvm':
        ensure  => 'file',
        owner   => 'root',
        group   => 'root',
        content => template("${module_name}/etc/default/hhvm.erb"),
    }
  
    file { '/etc/init.d/hhvm':
        ensure  => 'file',
        mode    => '0755',
        owner   => 'root',
        group   => 'root',
        source => 'puppet:///modules/hhvm/etc/init.d/hhvm',
    }
          
    file { '/etc/hhvm/config.hdf':
        ensure  => 'file',
        owner   => 'root',
        group   => 'root',
        content => template("${module_name}/etc/hhvm/config.hdf.erb"),
    }
    
    /* this is only needed for www-data */
    file { '/var/www/.hhvm.hhbc':
        ensure  => 'file',
        owner   => $hhvm_user,
        group   => $hhvm_user
    }
}