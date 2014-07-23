execute "Stop the nodejs daemon" do
  command "pm2 stop -u #{node[:codetalker][:user]} codetalker"
  environment ({'HOME' => node[:codetalker][:user_home] })
  user node[:codetalker][:user]
  cwd node[:codetalker][:deploy_dir]
  only_if "pm2 describe codetalker"
end
