set :application, "mapbuilder"
set :repository,  "git@poweredbydra.com:mapbuilder"
set :scm, :git
set :deploy_to, "/var/www/mapbuilder-deploy"
set :user, "deploy"
set :use_sudo, false

#set :bundle_without, [:development, :test]
#require "bundler/capistrano"


role :web, "poweredbydra.com"
role :app, "poweredbydra.com"
role :db,  "poweredbydra.com", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end