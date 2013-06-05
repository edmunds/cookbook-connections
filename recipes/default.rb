#
# Cookbook Name:: connections
# Recipe:: default
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

# node['ohai']['plugin_path'] is from the ohai cookbook.
# If this directory doesn't exist, kvetch.
if ! File.directory? node['ohai']['plugin_path'] then
  Chef::Log.warn("The directory #{node['ohai']['plugin_path']} per node['ohai']['plugin_path'] doesn't exist.  See connections cookbook README.")
end

tem = template "#{node['ohai']['plugin_path']}/connections.rb" do
  source 'connections.rb.erb'
  owner 'root'
  group 'root'
  mode 0755
  action :nothing
end
tem.run_action(:create)

# reload the ohai plugins if the template was changed
if tem.updated?
  ohai 'custom_plugins' do
    action :nothing
  end.run_action(:reload)
end

netstat_script = File.join(node['connections']['scripts_path'],"netstat.pl")

template netstat_script do
  source 'netstat.pl.erb'
  owner 'root'
  group 'root'
  mode 0755
end

connections_db = File.join(node['connections']['connections_log_dir'],node['connections']['connections_log_file'])

# Build the arguments for the netstat script
netstat_script_args = " -i #{connections_db} "
if ! node['connections']['netstat_max_entries'].empty? then
  netstat_script_args += " -m #{node['connections']['netstat_max_entries']} "
end
if ! node['connections']['netstat_expiration'].empty? then
  netstat_script_args += " -x #{node['connections']['netstat_expiration']} "
end
if ! node['connections']['netstat_max_count'].empty? then
  netstat_script_args += " -c #{node['connections']['netstat_max_count']} "
end

netstat_command = netstat_script + netstat_script_args

directory node['connections']['connections_log_dir'] do
  recursive true
  owner "root"
  group "root"
  mode 0755
end

cron "netstat cron" do
  minute node['connections']['netstat_cron_minute']
  hour node['connections']['netstat_cron_hour']
  day node['connections']['netstat_cron_day']
  month node['connections']['netstat_cron_month']
  weekday node['connections']['netstat_cron_weekday']
  command "#{netstat_command}"
end
