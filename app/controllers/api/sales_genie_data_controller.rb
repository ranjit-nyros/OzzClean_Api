module Api
  class SalesGenieDataController < ApplicationController
    before_filter :restrict_access
      respond_to :json
      
  def index
        @api_key = ApiKey.find_by_access_token(params[:access_token])
        @sales_genie_data = SalesGenieDatum.find(:all ,:conditions =>["user_id = ? and organization_id = ?",@api_key.user_id ,@api_key.organization_id]) if @api_key
        respond_with @sales_genie_data
  end

  private 
      def restrict_access
        # authenticate_or_request_with_http_token do |token, options|
        #   ApiKey.exists?(access_token: token)
        # end
        api_key  = ApiKey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key 
      end

end 
end 