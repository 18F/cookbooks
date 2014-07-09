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
   repository node[:codetalker][:git_repo]
   reference node[:codetalker][:git_branch]
   action :sync
end

# #Install Nodejs and npm
include_recipe "nodejs" 

npm_package "grunt-cli@>0.4.5"
npm_package "bower@>1.3.2"

# apt_repository 'nodejs' do
#   uri          'http://ppa.launchpad.net/chris-lea/node.js/ubuntu/'
#   distribution 'trusty'
#   components   ['main']
#   keyserver    'keyserver.ubuntu.com'
#   key          '87374F5D'
# end
# recipe[apt]


# file node[:codetalker][:librarian_script] do
# 	mode "700"
# end

# execute "bash #{node[:codetalker][:librarian_script]}" do
#   user "root"
# end

# execute "puppet apply #{node[:codetalker][:manifest]}" do
#   user "root"
# end
