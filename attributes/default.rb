#
# Cookbook Name:: connections
# Attribute:: default
#
# Copyright 2013, Edmunds.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default["connections"]["scripts_path"] = "/usr/local/bin"

default["connections"]["netstat_cron_minute"] = "*"
default["connections"]["netstat_cron_hour"] = "*"
default["connections"]["netstat_cron_day"] = "*"
default["connections"]["netstat_cron_month"] = "*"
default["connections"]["netstat_cron_weekday"] = "*"

default["connections"]["netstat_max_entries"] = ""
default["connections"]["netstat_expiration"] = ""
default["connections"]["netstat_max_count"] = ""

default["connections"]["connections_log_dir"] = "/var/log/connections"
default["connections"]["connections_log_file"] = "connections.txt"
