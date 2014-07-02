module Api
  
    class ListCleansController < ApplicationController
      #http_basic_authenticate_with  name: "ranjit" , password: "secret"
      before_filter :restrict_access
      respond_to :json

      def index
        @list_cleans = current_user.organization.list_cleans#ListClean.find(:all ,:conditions =>["user_id = ? and organization_id = ?",@api_key.user_id ,@api_key.organization_id]) if @api_key
          if @api_key  && @sales_genie_data       
            respond_with @list_cleans
          elsif !@api_key
            render :json => "Invalid Access Token"
          else
            respond_with @list_cleans
          end
        
      end

      def show
        @list_clean = ListClean.find(params[:id].to_i) if @api_key
        respond_with @list_clean
      end

      def create
        respond_with ListClean.create(params[:list_clean])
      end

      def update
        respond_with ListClean.update(params[:id], params[:list_clean])
      end

      def destroy
        respond_with ListClean.destroy(params[:id])
      end
      private 
      def restrict_access
        # authenticate_or_request_with_http_token do |token, options|
        #   ApiKey.exists?(access_token: token)
        # end
        @api_key  = ApiKey.find_by_access_token(params[:access_token])
        #head :unauthorized unless api_key
        return @api_key 
      end
    end
  
end