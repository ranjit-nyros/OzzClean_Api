module Api
  class UsersController < ApplicationController
      before_filter :restrict_access
      respond_to :json


      def index
        @users = current_user.organization.users
          if @api_key  && @users       
            respond_with @users
          elsif !@api_key
            render :json => "Invalid Access Token"
          else
            respond_with @users
          end
        end 
  end
end
