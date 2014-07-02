module Api
  class UsersController < ApplicationController
      before_filter :restrict_access
      respond_to :json


      def index
        @users = User.find(:all ,:conditions =>["organization_id = ?",@api_key.organization_id]) if @api_key
          if @api_key  && @users       
            respond_with @users
          elsif !@api_key
            render :json => "Invalid Access Token"
          else
            respond_with @users
          end
      end 

      def show
        @user = User.find_by_id(params[:num].to_i)
        respond_with @user
      end 

  end
end
