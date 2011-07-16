require 'bundler/capistrano'
equire 'deprec/cap/callbacks/asset_pipeline'
require 'capistrano/ext/multistage'

set :stages, %w( uat production )
set :default_stage, 'uat'

set :user, 'deploy'

set :application, "gemstalker"
set :deploy_to, "/srv/#{application}" # append -RAILS_ENV ?
set :repository,  "git@github.com:/mbailey/gemstalker.git"

# set :gateway, 'd.failmode.com'

set :scm, :git
set :deploy_via, :remote_cache

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    # no need for sudo?
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# cap deploy:setup HOSTS=mbailey@uat
after 'deploy:setup' do
  run "#{sudo} chown -R #{user} #{deploy_to}"
end

after 'deploy:update_code' do
  run "ln -nfs #{shared_path}/system/database.yml #{release_path}/config/database.yml"
  # top.bundle.install
end
