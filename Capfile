load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
Dir['config/*/recipes.rb'].each { |plugin| load(plugin) }
require 'clip'
load 'config/deploy'
