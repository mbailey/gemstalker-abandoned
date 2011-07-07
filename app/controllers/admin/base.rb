class Admin::BaseController < ApplicationController
  protect_from_forgery
  # before_filter :require_admin
  session :disabled => false
  
  # layout 'admin'
end
