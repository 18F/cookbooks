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

directory node[:codetalker][:cache_dir] do
  owner node[:codetalker][:user]
  group node[:codetalker][:group]
  recursive true
  mode 0770
  action :create
end

#Install Nodejs and npm
include_recipe "nodejs" 
# Install global packages for command line via npm
npm_package "grunt-cli@>0.4.5"
npm_package "bower@>1.3.2"
npm_package "forever@>0.11.1"