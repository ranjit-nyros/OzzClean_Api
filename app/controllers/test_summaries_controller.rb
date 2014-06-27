class TestSummariesController < ApplicationController
  # GET /test_summaries
  # GET /test_summaries.json
  def index
	@q = current_user.organization.test_summaries.search(params[:q])
        @test_summaries = @q.result(:distinct => true).page(params[:page]).per(25)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_summaries }
    end
  end

  # GET /test_summaries/1
  # GET /test_summaries/1.json
  def show
    @test_summary = TestSummary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_summary }
    end
  end

  # GET /test_summaries/new
  # GET /test_summaries/new.json
  def new
    @test_summary = TestSummary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_summary }
    end
  end

  # GET /test_summaries/1/edit
  def edit
    @test_summary = TestSummary.find(params[:id])
  end

  # POST /test_summaries
  # POST /test_summaries.json
  def create
#render :text => params[:test_summary][:file].inspect and return
    @test_summary = TestSummary.new(params[:test_summary])
	@test_summary.test_date = change_date_format(params[:test_summary][:test_date]) if !params[:test_summary][:test_date].blank?
	@test_summary.user = current_user
	@test_summary.organization = current_user.organization
#render :text => params[:test_summary] and return
    respond_to do |format|
      if @test_summary.save

        format.html { redirect_to @test_summary, notice: 'Test summary was successfully created.' }
        format.json { render json: @test_summary, status: :created, location: @test_summary }
      else
        format.html { render action: "new" }
        format.json { render json: @test_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_summaries/1
  # PUT /test_summaries/1.json
  def update
    @test_summary = TestSummary.find(params[:id])

    respond_to do |format|
    params[:test_summary][:test_date] = change_date_format(params[:test_summary][:test_date]) if !params[:test_summary][:test_date].blank?
#render :text => params[:test_summary] and return
      if @test_summary.update_attributes(params[:test_summary])
        format.html { redirect_to @test_summary, notice: 'Test summary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_summaries/1
  # DELETE /test_summaries/1.json
  def destroy
    @test_summary = TestSummary.find(params[:id])
    @test_summary.destroy

    respond_to do |format|
      format.html { redirect_to test_summaries_url }
      format.json { head :no_content }
    end
  end

	def search
	 params[:q][:test_date_cont] = change_date_format(params[:q][:test_date_cont]) if !(params[:q][:test_date_cont]).blank?
    params[:q][:test_date_cont] =  params[:q][:test_date_cont].to_date.strftime("%d/%Y/%m") if !(params[:q][:test_date_cont]).blank?  

 params[:q][:test_date_gteq] = change_date_format(params[:q][:test_date_gteq]) if !(params[:q][:test_date_gteq]).blank?
    params[:q][:test_date_gteq] =  params[:q][:test_date_gteq].to_date.strftime("%d/%Y/%m") if !(params[:q][:test_date_gteq]).blank?  
     params[:q][:test_date_lteq] = change_date_format(params[:q][:test_date_lteq]) if !(params[:q][:test_date_lteq]).blank?
    params[:q][:test_date_lteq] =  params[:q][:test_date_lteq].to_date.strftime("%d/%Y/%m") if !(params[:q][:test_date_lteq]).blank?  


		if params[:q]
			@q = current_user.organization.test_summaries.search(params[:q])
			@test_summaries = @q.result(:distinct => true).page(params[:page]).per(25)
		end
	end
end
