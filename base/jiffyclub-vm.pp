package { "dkms":
    ensure => latest,
}

package { "chromium-browser":
    ensure => latest,
}

package { "emacs":
    ensure => latest,
}

package { "firefox":
    ensure => latest,
}

package { "gcc":
    ensure => latest,
}

package { "gedit":
    ensure => latest,
}

package { "git":
    ensure => latest,
}

package { "ipython-notebook":
    ensure => latest,
}

package { "make":
    ensure => latest,
}

package { "mercurial":
    ensure => latest,
}

package { "nano":
    ensure => latest,
}

package { "python":
    ensure => latest,
}

package { "python-matplotlib":
    ensure => latest,
}

package { "python-imaging":
    ensure => latest,
}

package { "python-nose":
    ensure => latest,
}

package { "python-numpy":
    ensure => latest,
}

package { "python-pandas":
    ensure => latest,
}

package { "python-pip":
    ensure => latest,
}

package { "python-pytest":
    ensure => latest,
}

package { "python-scipy":
    ensure => latest,
}

package { "python-tables":
    ensure => latest,
}

package { "python-xlrd":
    ensure => latest,
}

package { "python-xlwt":
    ensure => latest,
}

package { "sqlite3":
    ensure => latest,
}

package { "subversion":
    ensure => latest,
}

package { "vim":
    ensure => latest,
}

package { "r-base":
    ensure => latest,
}

package { "r-base-dev":
    ensure => latest,
}

package { "r-cran-plyr":
    ensure => latest,
}

package { "r-cran-reshape2":
    ensure => latest,
}

package { "r-cran-ggplot2":
    ensure => latest,
}

# for RCurl
package { "libcurl4-gnutls-dev":
    ensure => latest,
}

# for XML
package { "libxml2-dev":
    ensure => latest,
}

package { "r-cran-xml":
    ensure => latest,
}

user { "swc":
    home => "/home/swc",
    ensure => present,
    shell => "/bin/bash",
    password => '$6$BVLnY8oD$oBFoqq2aiZDQU/XaiMZrcuHz7ynf0Fq7EDIDp8nmXweo44oLz1.Vis1GTHgUbyNC4./.LEfwVgQci.uDgpj.V/',
    managehome => true,
}

file { "user_info":
    path => "/home/swc/Desktop/user_info",
    ensure => file,
    mode => 0644,
    require => User["swc"],
    content => "Username: swc
Password: swc
",
}

file { "gitconfig":
    path => "/etc/gitconfig",
    ensure => file,
    mode => 0644,
    content => "[core]
    editor = gedit
[color]
    ui = auto
",
}
