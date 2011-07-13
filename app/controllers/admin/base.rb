class Admin::Base < Admin::Base
  protect_from_forgery
  # before_filter :require_admin
  # session :disabled => false
  
  # layout 'admin'
  #
  before_filter :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "mbailey" && password == "FatPlonky99"
    end
  end

end
