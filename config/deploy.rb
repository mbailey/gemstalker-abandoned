require 'deprec'
require 'bundler/capistrano'
require 'deprec/callbacks/asset_pipeline'
require 'deprec/callbacks/deploy'
require 'capistrano/ext/multistage'

set :stages, %w( uat production )
set :default_stage, 'uat'

set :application, "gemstalker"
set :deploy_to, "/srv/#{application}" # append -RAILS_ENV ?
set :repository,  "git@github.com:/mbailey/gemstalker.git"

# set :gateway, 'd.failmode.com'

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    # no need for sudo?
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
