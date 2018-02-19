#
# Cookbook:: redirects
# Recipe:: vhost
#
# Copyright:: 2018, Rodrigo Torres <rlinstorres@gmail.com>
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

data_bag = node['redirects']['data_bag']['name']
tag = node['redirects']['data_bag']['tag']

#require 'pry'
#binding.pry

search(data_bag, "tag:#{tag}") do |bag|
  bag[node.chef_environment].each do |site, config|
    directory config['docroot'] do
      mode 0755
      owner node['apache']['user']
      group node['apache']['group']
      recursive true
    end

    if config['disable']
      config = ::File.join(node['apache']['dir'], 'sites-enabled', "#{site}.conf")

      file config do
        action :delete
        only_if { ::File.exist?(config) }
      end

    else

      web_app site.to_s do
        cookbook  'redirects'
        template  'vhost.conf.erb'
        config    config
      end

    end
  end
end
