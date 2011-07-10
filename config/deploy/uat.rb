set :rails_env, "production"
set :domain, "uat.gemstalker.com"
role :web, "uat.int.failmode.com" 
role :app, "uat.int.failmode.com" 
role :db,  "uat.int.failmode.com", :primary => true
