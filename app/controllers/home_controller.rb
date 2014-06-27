class HomeController < ApplicationController
  before_filter :authorize
  def index
    redirect_to list_cleans_path 
  end

  def ozzmenu

  end 

end
