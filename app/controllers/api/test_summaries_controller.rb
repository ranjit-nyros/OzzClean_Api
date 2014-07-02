module Api
  class TestSummariesController < ApplicationController
      before_filter :restrict_access
      respond_to :json


      def index
        @test_summaries = current_user.organization.test_summaries
          if @api_key  && @test_summaries       
            respond_with @test_summaries
          elsif !@api_key
            render :json => "Invalid Access Token"
          else
            respond_with @test_summaries
          end
        end 

  end
end