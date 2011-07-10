class UsersController < ApplicationController

  def home
    if current_user
      @rubygems = current_user.rubygems
    else
      redirect_to rubygem_path('rails') 
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by_email(params[:email])
    @user.password = @user.password_confirmation = 'foobar'

    if @user.save
      session[:user_id] = @user.id
      if params[:rubygem]
        @rubygem = Rubygem.find_or_create_by_name(params[:rubygem])
        if @user.rubygems << @rubygem
          redirect_to rubygem_path(@rubygem.name), 
            :notice => "We'll email you about new releases of #{@rubygem.name}"
        else
          redirect_to root_url, 
            :notice => "Signed up (but failed to subscribe to #{@rubygem.name})"
        end
      else
        redirect_to root_url, :notice => "Signed up!"
      end
    else
      render "new"
    end
  end
end
