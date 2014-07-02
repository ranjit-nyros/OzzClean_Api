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

  private 
      def restrict_access
         #  authenticate_or_request_with_http_token do |token, options|                
         #   ApiKey.exists?(access_token: token)
         # end

        @api_key  = ApiKey.find_by_access_token(params[:access_token])
        #head :unauthorized unless api_key 
        return @api_key

      end

end 
end 