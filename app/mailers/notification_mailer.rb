class NotificationMailer < ActionMailer::Base
 # default from: "from@example.com"

   def testmail
   
    mail(:from => "OzzData<noreply@ozzdata.com>",
       :to => "ratnakarrao_nyros@yahoo.com",
       :subject => "account notification")
   end
   
   def create_account(user)
     @user=user
    mail(:from => "OzzData<noreply@ozzdata.com>",
         :to => "anusha_nyros@yahoo.com",
         :subject => "new account notification")
   end  

    def orguser_notify(user)
        @user=user
         mail(:from => "OzzData<noreply@ozzdata.com>",
         :to => "anusha_nyros@yahoo.com",
         :subject => "new account notification")
    end  


  def feedback(first_name,last_name,email,message,company_name,msgtype)
      @first_name = first_name
      @last_name = last_name
      @email = email
      @message = message
      @company_name = company_name
         mail(:from => "OzzData<noreply@ozzdata.com>",
               :to => "anusha_nyros@yahoo.com",
               :cc => "anusha_nyros@yahoo.com",
               :subject => msgtype,
               :date => Time.now)

end
  def generate_api(name,email,company,token)
      @name = name
      @company = company
      @email = email
      @token = token
      
         mail(:from => "OzzClean<ranzit005@gmail.com>",
               :to => @email,
               
               :subject =>'API Key Request',
               :date => Time.now)

end

def thanks_feedback_email(first_name,last_name,email)
      @first_name = first_name
      @last_name = last_name
      @email = email

         mail(:from => "OzzData<noreply@ozzdata.com>",
               :to => email,
               :subject => "Thank You  ",
               :date => Time.now)

end 

def login_mail(user)
		@user = user
		mail(:from => "OzzData<noreply@ozzdata.com>",
               :to => "anusha_nyros@yahoo.com",
               :subject => "#{user.capitalize} has Logged In",
               :date => Time.now)
	end


end
