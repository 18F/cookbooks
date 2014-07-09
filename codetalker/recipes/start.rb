execute "start the nodejs server as a daemon" do
	command "forever start -p #{node[:codetalker][:cache_dir]} server.js"
  user node[:codetalker][:user]
  cwd node[:codetalker][:deploy_dir]
#  not_if "ps -ef | grep [f]orever"
end