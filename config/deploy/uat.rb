set :rails_env, "production"
set :domain, "uat.gemstalker.com"
set :passenger_server_alii, []
role :web, "uat.int.failmode.com" 
role :app, "uat.int.failmode.com" 
role :db,  "uat.int.failmode.com", :primary => true
