require 'bundler/capistrano'

require 'deprec/callbacks/asset_pipeline'
require 'deprec/callbacks/passenger'
require 'deprec/callbacks/deploy'

require 'capistrano/ext/multistage'

set :stages, %w( uat production )
set :default_stage, 'uat'

set :application, "gemstalker"
set :deploy_to, "/srv/#{application}" # append -RAILS_ENV ?
set :repository,  "git@github.com:/mbailey/gemstalker.git"

set :gateway, 'd.failmode.com'
