name		 "connections"
maintainer       "Edmunds.com"
maintainer_email "jmiller@edmunds.com"
license          "Apache 2.0"
description      "Collects network connections on a system and presents via an ohai plugin"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe "connections::default", "Installs collection script, driver cron job, and custom ohai plugin"

supports 'redhat', ">= 4.0"

depends "ohai"
