set :rails_env, "production"
set :domain, "gemstalker.com"
role :web, "l2.linode.failmode.com" 
role :app, "l2.linode.failmode.com" 
role :db,  "l2.linode.failmode.com", :primary => true
