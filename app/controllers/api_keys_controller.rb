class ApiKeysController < ApplicationController
#  # GET /api_keys
#  # GET /api_keys.json
before_filter :authorize_user ,:only => :new
 def index
 end


#  # GET /api_keys/new
#  # GET /api_keys/new.json
  def new
    @api_key = ApiKey.new

  end

# #  # GET /api_keys/1/edit
# #  def edit
# #    @api_key = api_key.find(params[:id])
# #  end

#   # POST /api_keys
#   # POST /api_keys.json
  def create
 #if params[:email].present? && params[:message].present?
 #render :text => params.inspect and return 

 @api_key = ApiKey.new(params[:api_key])
 @api_key.organization_id = current_user.organization
 @api_key.user_id = current_user
     respond_to do |format|
      if @api_key.save

       NotificationMailer.generate_api(params[:api_key][:name], params[:api_key][:email] , params[:api_key][:company], @api_key.access_token).deliver
          format.html {redirect_to api_keys_path, :notice => 'Your api key has generated check your email .'}
      else
        format.html { render action: "new" }
        format.json { render json: @api_key.errors, status: :unprocessable_entity }
      end
    end
end
private 

def authorize_user
    redirect_to login_url, alert: "You dont have rights to request an api key unless you are a app user. Signup ,login and request api key." unless current_user 

end
end
