class SessionsController < ApplicationController
 # layout "app1"
  def new
    if current_user
      if current_user.admin?
        redirect_to admin_root_path
      else
        redirect_to root_path
      end
    end
  end
  
  def create
	
    @user = login(params[:username], params[:password], params[:remember_me])
	#render text: @user.inspect and return 
    if @user
      if !@user.active?
       logout
       flash.now[:error] = "User are not active"
       render :new
      else 
	NotificationMailer.login_mail(params[:username]).deliver
        redirect_to list_cleans_url, notice: "Logged in!" 
      end
    else
	logout
      flash.now[:error] = "Username or Password was invalid"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to login_url, notice: "Logged out!"
  end
end
