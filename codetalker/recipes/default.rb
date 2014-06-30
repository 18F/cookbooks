#
# Cookbook Name:: codetalker
# Recipe:: default
#
# Copyright 2014, Example Com
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

user node[:codetalker][:user] do
  action :create
  system true
  shell "/bin/false"
end

directory node[:codetalker][:deploy_dir] do
  owner node[:codetalker][:user]
  group node[:codetalker][:group]
  recursive true
  mode 0770
  action :create
end

git node[:codetalker][:deploy_dir] do
   repository "https://github.com/18F/codetalker.git"
   reference "master"
   action :sync
end

file node[:codetalker][:librarian_script] do
	mode "700"
end

execute "bash #{node[:codetalker][:librarian_script]}" do
  user "root"
end

execute "puppet apply #{node[:codetalker][:manifest]}" do
  user "root"
end
