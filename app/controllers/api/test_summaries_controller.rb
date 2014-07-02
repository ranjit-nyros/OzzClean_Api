module Api
  class TestSummariesController < ApplicationController
      before_filter :restrict_access
      respond_to :json


      def index
        @test_summaries = TestSummary.find(:all ,:conditions =>["user_id = ? and organization_id = ?",@api_key.user_id ,@api_key.organization_id]) if @api_key
          if @api_key  && @test_summaries       
            respond_with @test_summaries
          elsif !@api_key
            render :json => "Invalid Access Token"
          else
            respond_with @test_summaries
          end
      end 

      def show
        @test_summary = TestSummary.find(params[:num].to_i)
        respond_with @test_summary
      end

  end
end