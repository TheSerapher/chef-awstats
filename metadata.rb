name              "awstats"
maintainer        "Sebastian Grewe"
maintainer_email  "sebastian.grewe@gmail.com"
license           "Apache 2.0"
description       "Installs/configures awstats"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.2.0"
recipe            "awstats::default", "Installs/configures awstats"

supports "ubuntu"
supports "debian"
supports "centos"
supports "rhel"

depends "apache2"
depends "yum"
