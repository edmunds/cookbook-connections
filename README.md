Description
===========

Installs a script (netstat.pl) for collecting and saving network connections, a cron job to drive said script, and an ohai plugin to present the aggregated connections data.

Attributes
==========

`node['connections']['scripts_path']` - filesystem location for netstat script 

`node['connections']['netstat_cron_minute']` - cron minute schedule for running netstat.pl
`node['connections']['netstat_cron_hour']` - cron hour schedule for running netstat.pl
`node['connections']['netstat_cron_day']` - cron day schedule for running netstat.pl
`node['connections']['netstat_cron_month']` - cron month schedule for running netstat.pl
`node['connections']['netstat_cron_weekday']` - cron weekday schedule for running netstat.pl

`node['connections']['netstat_max_entries']` - total number of connections to keep track of - default 50 
`node['connections']['netstat_expiration']` - seconds until a previously-observed connection is expired - default 86400
`node['connections']['netstat_max_count']` - a threshold to trigger count scale-down.  It can be any large number.

`node['connections']['connections_log_dir']` - filesystem location for the connections "database"
`node['connections']['connections_log_file']` - file name for the connections "database"

Usage
=====

This cookbook is to be used in conjunction with the Opscode ohai cookbook.  You need the Opscode ohai cookbook first.  This cookbook's default recipe should be put after the ohai default recipe in your run_list.  See http://community.opscode.com/cookbooks/ohai.

The connections recipe will configure the netstat collection script, cron job, connections "database" (a file), and add a custom ohai plugin which parses the database and presents the associated attributes.  After a couple chef-client runs you should expect to see entries under node["automatic"]["connections"] during chef searches.

Changes
=======

## v0.0.1

- first cut

License and Author
==================

Author:: Joshua Miller (<jmiller@edmunds.com>)

Copyright:: 2013, Edmunds.com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
