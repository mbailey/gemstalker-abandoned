class RubygemsController < ApplicationController

  def show
    @rubygem = Rubygem.find_or_create_by_name params[:name]
  end

end
