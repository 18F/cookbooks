git node[:codetalker][:deploy_dir] do
   user node[:codetalker][:user]
   repository node[:codetalker][:git_repo]
   reference node[:codetalker][:git_branch]
   action :sync
end

#
execute "Install Bower client-side dependencies" do
  command "bower install --quiet" 
  environment ({'HOME' => '#{node[:codetalker][:deploy_dir]}'})
  user node[:codetalker][:user]
  cwd  node[:codetalker][:deploy_dir]
end

execute "Install npm server side dependencies and build the system" do
  command "npm install"
  environment ({'HOME' => '#{node[:codetalker][:deploy_dir]}'})
  user node[:codetalker][:user]
  cwd  node[:codetalker][:deploy_dir]
end