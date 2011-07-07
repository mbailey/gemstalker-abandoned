class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    params[:user][:password] = 'foobar'
    params[:user][:password_confirmation] = 'foobar'
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      if params[:rubygem]
        @rubygem = Rubygem.find_or_create_by_name(params[:rubygem])
        if @user.rubygems << @rubygem
          redirect_to gem_page_path(@rubygem.name), :notice => "We'll notify you about new releases of #{@rubygem.name}"
        else
          redirect_to root_url, :notice => "Signed up (but failed to subscribe to #{@rubygem.name})"
        end
      else
        redirect_to root_url, :notice => "Signed up!"
      end
    else
      render "new"
    end
  end
end
