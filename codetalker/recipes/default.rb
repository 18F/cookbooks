# user node[:codetalker][:user] do
#   action :create
#   system true
# #  shell "/bin/false"
# end

user node[:codetalker][:user] do
  supports :manage_home => true
  comment "Codetalker user"
  uid 2375 
  gid "users"
  home "/home/codetalker"
  shell "/bin/bash"
end

directory node[:codetalker][:deploy_dir] do
  owner node[:codetalker][:user]
  group node[:codetalker][:group]
  recursive true
  mode 0770
  action :create
end

# directory node[:codetalker][:cache_dir] do
#   owner node[:codetalker][:user]
#   group node[:codetalker][:group]
#   recursive true
#   mode 0770
#   action :create
# end

#Install Nodejs and npm
include_recipe "nodejs" 
# Install global packages for command line via npm
npm_package "grunt-cli@>0.4.5"
npm_package "bower@>1.3.2"
# npm_package "forever@>0.11.1"
npm_package "pm2@>0.9.1"

apt_package "libcap2-bin" do
  action :install
end
execute "give safe user permission to use port 80" do
  command "setcap cap_net_bind_service=+ep /usr/local/bin/node"
  action :run
end