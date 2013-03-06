#
# Cookbook Name:: awstats
# Attributes:: default
#
# Copyright (C) 2013 Sebastian Grewe <sebastian.grewe@gmail.com>
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

# Reload apache on configuration change
default['awstats']['reload_apache'] = false

# Platform specific values for apache2 configuration
case node['platform_family']
when 'rhel'
  default['awstats']['basedir'] = '/var/www/awstats'
  default['awstats']['cgidir'] = node['awstats']['basedir']
when 'debian'
  default['awstats']['basedir'] = '/usr/share/awstats'
  default['awstats']['cgidir'] = '/usr/lib/cgi-bin'
end

default['awstats']['icondir'] = node['awstats']['basedir'] + '/icon'
default['awstats']['scriptalias'] = '/awstats'
default['awstats']['config']['dircgi'] = node['awstats']['scriptalias']
default['awstats']['config']['diricons'] = '/awstatsicons'
default['awstats']['config']['dirdata'] = '/var/lib/awstats'
default['awstats']['config']['dirlang'] = node['awstats']['basedir'] + '/lang'
