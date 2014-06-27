class SalesGenieDatum < ActiveRecord::Base

attr_accessible :good, :upload_date, :file, :phone_num, :company, :contact, :sic, :zip, :area_code, :address, :city, :state, :sic_description, :owner, :cfo, :controller, :ap, :ar, :hr, :cio, :it, :sales_manager, :user_id, :organization_id, :list_clean_id, :exp_date, :score, :emp_size, :iusa_num, :fax_num, :sales_volume,:count, :up_date, :last_updated_date, :title

belongs_to :organization
belongs_to :user
belongs_to :list_clean

validates_presence_of :phone_num, :message => "Must have Phone number"

validates_uniqueness_of :phone_num, :message => "Phone number must be unique"

validates_format_of :phone_num, :with  => /(?:\+?|\b)(\(\d{3}\)\s?\d{3}[-][0-9]{4})\b/, :message => "Invalid Phone Number"



end
