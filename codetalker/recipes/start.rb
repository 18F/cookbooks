execute "start the nodejs server as a daemon" do
  # command "forever start -p "+node[:codetalker][:cache_dir]+ " server.js"
  command "pm2 start -u #{node[:codetalker][:user]} server.js "
  environment ({'HOME' => node[:codetalker][:user_home] })
  user node[:codetalker][:user]
  cwd node[:codetalker][:deploy_dir]
  # not_if "ps -ef | grep [f]orever"
end