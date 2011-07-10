class RubygemsController < ApplicationController

  def show
    @user = current_user || User.new
    @rubygem = Rubygem.find_or_create_by_name params[:name]
    if ! @rubygem.errors.empty?
      redirect_to rubygem_path(:name=>'rails'), 
        :notice => "Couldn't find #{@rubygem.name}. Did you mean 'rails'?"
    end
  end

end
