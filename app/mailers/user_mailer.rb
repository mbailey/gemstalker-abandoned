class UserMailer < ActionMailer::Base
  default from: "gemstalk@gmail.com"

  def release_notification(follow, release)
    @follow, @release = follow, release
    mail(:to => "#{follow.user.name} <#{follow.user.email}>", :subject => "#{release.rubygem_name}-#{release.version} released")
  end

end
