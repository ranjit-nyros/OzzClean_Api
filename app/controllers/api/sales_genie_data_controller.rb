module Api
  class SalesGenieDataController < ApplicationController
    before_filter :restrict_access
      respond_to :json

  def index
      @sales_genie_data = current_user.organization.sales_genie_data#SalesGenieDatum.find(:all ,:conditions =>["user_id = ? and organization_id = ?",@api_key.user_id ,@api_key.organization_id]) if @api_key        
      if @api_key  && @sales_genie_data       
        respond_with @sales_genie_data
      elsif !@api_key
        render :json => "Invalid Access Token"
      else
        respond_with @sales_genie_data
      end  

  end
  
end 
end 