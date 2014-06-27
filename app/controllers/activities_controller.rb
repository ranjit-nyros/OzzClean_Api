class ActivitiesController < ApplicationController
  before_filter :authorize

  def index
   @q = Activity.where("user_id = ? OR priority like ? ", "#{current_user.id}","%Yes%").search(params[:q])
    #@q = current_user.activities.search(params[:q])
    @activities = @q.result(:distinct  => true).page(params[:page])
	puts @activities.inspect
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end
  
  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @activity = Activity.new
    @current_date = params[:current_date]
    #if params[:category]
     # @category = current_user.user_categories.find(params[:category])
     # @activity.category = @category
    #end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(params[:activity])
    @activity.user = current_user
    @activity.organization = current_user.organization
    @activity.date = change_date_format(params[:activity][:date]) if !(params[:activity][:date]).blank?
    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_path(@activity), notice: 'Data was successfully created.' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    # make sure that user have access to activity else raise execption
   # current_user.user_activities.find(params[:id])
    
    # re query from database beacuse user_activities call have joins operation that make the record readony
    @activity = Activity.find(params[:id])
    params[:activity][:date] = change_date_format(params[:activity][:date]) if !(params[:activity][:date]).blank?
    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to activity_path(@activity), notice: 'Data  was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy    
    @activity = current_user.user_activities.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_path }
      format.json { head :no_content }
    end
  end
  
  def search
   
puts params[:q][:date_cont]

params[:q][:date] = params[:q][:date].to_date.strftime("%d/%Y/%m") if !(params[:q][:date]).blank?  

     params[:q][:date_cont] = change_date_format(params[:q][:date_cont]) if !(params[:q][:date_cont]).blank?
     params[:q][:date_cont] =  params[:q][:date_cont].to_date.strftime("%d/%Y/%m") if !(params[:q][:date_cont]).blank?  

params[:q][:date_gteq] = change_date_format(params[:q][:date_gteq]) if !(params[:q][:date_gteq]).blank?
     params[:q][:date_gteq] =  params[:q][:date_gteq].to_date.strftime("%d/%Y/%m") if !(params[:q][:date_gteq]).blank?   

params[:q][:date_lteq] = change_date_format(params[:q][:date_lteq]) if !(params[:q][:date_lteq]).blank?
     params[:q][:date_lteq] =  params[:q][:date_lteq].to_date.strftime("%d/%Y/%m") if !(params[:q][:date_lteq]).blank?    
    if params[:q]
    @q = Activity.where("user_id = ? OR priority like ? ", "#{current_user.id}","%Yes%").search(params[:q])
      @activities = @q.result(:distinct  => true).page(params[:page])
    end
    
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end
end
