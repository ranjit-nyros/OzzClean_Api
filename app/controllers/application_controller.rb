class ApplicationController < ActionController::Base
  protect_from_forgery
def authorize
    redirect_to login_url, alert: "Please log in first!" unless current_user 

  end
#for changing the date format in to mm/yy/dd while creating time
 def change_date_format(date)
    date_array = date.split("/")
    if date_array[1].to_i > 12
      new_date = date_array[1]+"/"+date_array[2]+"/"+date_array[0]
    else
      new_date = date_array[0]+"/"+date_array[2]+"/"+date_array[1]
    end
    puts "anusha"
    puts new_date.inspect
    return new_date
  end
   def change_date_format1(date)
    date_array = date.split("/")
    new_date = date_array[0]+"/"+date_array[2]+"/"+date_array[1]
    puts "anusha"
    puts new_date.inspect
    return new_date
  end
end
