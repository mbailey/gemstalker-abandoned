ActionMailer::Base.smtp_settings = {
  :address              => "localhost",
  :port                 => 25,
  :enable_starttls_auto => false
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
# Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
