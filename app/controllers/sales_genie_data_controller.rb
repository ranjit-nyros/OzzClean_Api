require 'rubygems'
require 'csv'
require 'write_xlsx'
class SalesGenieDataController < ApplicationController
autocomplete :sales_genie_datum, :state
autocomplete :sales_genie_datum, :zip
  # GET /sales_genie_data
  # GET /sales_genie_data.json
  def index
   @q = current_user.organization.sales_genie_data.search(params[:q])
   @sales_genie_data = @q.result(:distinct  => true).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales_genie_data }
    end
  end

  # GET /sales_genie_data/1
  # GET /sales_genie_data/1.json
  def show
    @sales_genie_datum = SalesGenieDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_genie_datum }
    end
  end

  # GET /sales_genie_data/new
  # GET /sales_genie_data/new.json
def new
    #@sales_genie_datum = SalesGenieDatum.new
@list_clean = ListClean.find(params[:id])
	file = File.basename(@list_clean.file_name.path)
	#path = File.join("#{Rails.root}","public",@list_clean.file_name.url)
	#puts path.inspect
       #	csv_text = File.read(path)
	#csv_text = csv_text.force_encoding("ISO-8859-1").encode("utf-8", replace: nil)
	#csv_text = csv_text.gsub('"',"").gsub("'","")
	#puts csv_text.inspect
	csv = CSV.parse open(File.join("#{Rails.root}","public",@list_clean.file_name.url)).read, :headers=>true, :converters=>:numeric
	#csv = csv.gsub('"',"").gsub("'","")
	#render :text => csv.inspect and return
 	array1 = Array.new 
	#render :text => csv[0][0].inspect and return
 	csv.each do |row| 
		validate_cols = [:phone_num]

  valid = validate_cols.inject(true){|valid_sum, col|
    valid_sum && send("validate_#{col}", row[col])
  }
               	array1 << ["#{row[0]}","#{row['Phone Number Combined']}","#{row['Date List Produced']}"," #{row['Record Expiration Date']}"," #{row['Company Name']}"," #{row['Mailing Address']}"," #{row['Mailing City']}"," #{row['Mailing State']}"," #{row['Mailing Zip Code']}"," #{row['Mailing Zip 4']}"," #{row['Credit Rating Score']} ","#{row['Location Employee Size Range']}","#{row['IUSA Number']}","#{row['Executive Last Name']}","#{row['Executive First Name']}","#{row['Executive Gender']}","#{row['Executive Title']}","#{row['FAX Number Combined']}","#{row['Primary SIC Code']}","#{row['Primary SIC Code Description']}","#{row['Location Sales Volume Range']}","#{row[21]}","#{row[22]}","#{row[23]}","#{row[24]}"]
		end 
	count = 0
	count1 = 0

	puts array1.inspect
	array1.each_with_index do |k|
		#render :text => k[0].inspect and return
 #d = Date.parse(k[3]) 
#render :text => d.class and return
@owner,@cfo,@cntl, @ar,@ap, @it,@sm, @hr,@cio = '','','','','','','','',''
		if k[0].include?("Good")
				if (k[16] == "Owner") || (k[16] == "President") || (k[16] == "Vice-President") 
					@owner = k[16]
				elsif k[16] == "CEO"
					@cfo = k[16]
				elsif k[16] == "Controller"
					@cntl = k[16]
				elsif k[16] == "AP"
					@ap = k[16]
				elsif k[16] == "AR"
					@ar = k[16]
				elsif k[16] == "HR"
					@hr = k[16]
				elsif k[16] == "CIO"
					@cio = k[16]
				elsif k[16] == "IT"
					@it = k[16]
				elsif (k[16] == "Manager") || (k[16] == "Sales Manager") || (k[16] == "Site Manager") || (k[16] == "Deputy Manager")
					@sm = k[16]
				end
  				object = SalesGenieDatum.find_by_phone_num(k[1])
				@area_code = k[1].scan(/^\(\d{3}\)/)[0].gsub(/[^\d]/, '') if !k[1].scan(/^\(\d{3}\)/)[0].nil?
        @date = change_date_format(params[:up_date]) if !params[:up_date].nil?
       # render :text => k[2] and return
  				if !object.nil?
					object.update_attributes!(:good =>k[0], :upload_date=>change_date_format(k[2]), :file=>"#{file}",:phone_num=>k[1],:company =>k[4],:contact=>(k[14]+"/"+k[13]+"/"+k[15]+"/"+k[16]+""),:title => k[16],:sic=>k[18],:zip=>k[8],:area_code =>@area_code,:address =>k[5],:city=>k[6], :state =>k[7] ,:sic_description => k[19] ,:owner => "#{@owner}",:cfo => "#{@cfo}",:controller => "#{@ctrl}",:ap => "#{@ap}",:ar => "#{@ar}",:hr => "#{@hr}",:cio => "#{@cio}",:it => "#{@it}",:sales_manager => "#{@sm}",:organization_id => @list_clean.organization_id ,:user_id => current_user.id,:list_clean_id => @list_clean.id, :exp_date => change_date_format(k[3]), :score => k[10], :emp_size => k[11], :iusa_num => k[12], :fax_num => k[17], :sales_volume => k[20], :up_date => @date)
				else
				   SalesGenieDatum.create! :good =>k[0], :upload_date=>change_date_format(k[2]), :file=>"#{file}",:phone_num=>k[1],:company =>k[4],:contact=>(k[14]+"/"+k[13]+"/"+k[15]+"/"+k[16]+""),:title => k[16],:sic=>k[18],:zip=>k[8],:area_code =>@area_code,:address =>k[5],:city=>k[6], :state =>k[7] ,:sic_description => k[19] ,:owner => "#{@owner}",:cfo => "#{@cfo}",:controller => "#{@ctrl}",:ap => "#{@ap}",:ar => "#{@ar}",:hr => "#{@hr}",:cio => "#{@cio}",:it => "#{@it}",:sales_manager => "#{@sm}",:organization_id => @list_clean.organization_id ,:user_id => current_user.id,:list_clean_id => @list_clean.id, :exp_date => change_date_format(k[3]), :score => k[10], :emp_size => k[11], :iusa_num => k[12], :fax_num => k[17], :sales_volume => k[20], :up_date => @date
				end
		end
	end
	redirect_to sales_genie_data_path, notice: "Sales Genie Data Created Successfully"
end


def validate_phone_num(phonenum)
           @sales = Array.new
           @salesgeniedata = current_user.organization.sales_genie_data
  	   @salesgeniedata.each do |k|
            if k.phone_num == phonenum
             @sales << "phonenum"
            end 
          end 
	puts @sales.inspect
         return true if @sales.any?
	
end


  # GET /sales_genie_data/1/edit
  def edit
    @sales_genie_datum = SalesGenieDatum.find(params[:id])
  end

  # POST /sales_genie_data
  # POST /sales_genie_data.json
  def create
	@sales_genie_datum = SalesGenieDatum.new(params[:sales_genie_datum])
    respond_to do |format|
      if @sales_genie_datum.save
        format.html { redirect_to new_sales_genie_datum, notice: 'Sales genie datum was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /sales_genie_data/1
  # PUT /sales_genie_data/1.json
  def update
    @sales_genie_datum = SalesGenieDatum.find(params[:id])

    respond_to do |format|
  params[:sales_genie_datum][:upload_date] = change_date_format(params[:datepicker]) if !(params[:datepicker]).blank?
  params[:sales_genie_datum][:last_updated_date] = change_date_format(params[:sales_genie_datum][:last_updated_date]) if !(params[:sales_genie_datum][:last_updated_date]).blank?
  params[:sales_genie_datum][:exp_date] = change_date_format(params[:datepicker1]) if !(params[:datepicker1]).blank?
      if @sales_genie_datum.update_attributes(params[:sales_genie_datum])
        format.html { redirect_to sales_genie_datum_path, notice: 'Sales genie datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_genie_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_genie_data/1
  # DELETE /sales_genie_data/1.json
  def destroy
    @sales_genie_datum = SalesGenieDatum.find(params[:id])
    @sales_genie_datum.destroy

    respond_to do |format|
      format.html { redirect_to sales_genie_data_url }
      format.json { head :no_content }
    end
  end



  def search 

    params[:q][:state_in] = params[:q][:state_in].join('').split(',') if !params[:q][:state_in].blank?
    params[:q][:zip_in] = params[:q][:zip_in].join('').split(',') if !params[:q][:zip_in].blank?
            #    render :text => params[:q][:contact_in].inspect and return
    #params[:q][:contact_in] = params[:q][:contact_in].to_s.gsub('  ', '/') if !params[:q][:contact_in].nil?

      @q = current_user.organization.sales_genie_data.search(params[:q])
      params[:q][:zip_in] = params[:q][:zip_in].join(',') if !params[:q][:zip_in].blank?
      params[:q][:state_in] = params[:q][:state_in].join(',') if !params[:q][:state_in].blank?
      #params[:q][:contact_in] = params[:q][:contact_in].gsub('/', ' ') if !params[:q][:contact_in].nil?
                #render :text => params[:q][:contact_cont].inspect and return
               @salesgeniedata_xls = @q.result
      @sales_genie_data = @q.result(:distinct  => true).page(params[:page]).per(25)

	respond_to do |format|
		format.html
	end
  end

def export_xls
	xls_path = File.join("#{Rails.root}/public/uploads/","sales_genie_data_info.xlsx")
workbook  = WriteXLSX.new(xls_path)
worksheet = workbook.add_worksheet
@data = Array.new
format = workbook.add_format(:center_across => 1,:bold => 1)
heading = workbook.add_format(:align => 'center', :bold => 1)
worksheet.write(0, 1, "Sales Genie Data", format)
worksheet.write_blank(0, 2, format)
worksheet.write_blank(0, 3, format)
worksheet.write_blank(0, 4, format)
worksheet.write_blank(0, 5, format)
worksheet.write_blank(0, 6, format)
worksheet.write_blank(0, 7, format)
worksheet.write_blank(0, 8, format)
worksheet.write_blank(0, 9, format)
worksheet.write_blank(0, 10, format)
worksheet.write_blank(0, 11, format)
worksheet.write_blank(0, 12, format)
worksheet.write_blank(0, 13, format)
worksheet.write_blank(0, 14, format)
worksheet.write_blank(0, 15, format)
worksheet.write_blank(0, 16, format)
worksheet.write_blank(0, 17, format)
worksheet.write_blank(0, 18, format)
worksheet.write_blank(0, 19, format)
worksheet.write_blank(0, 20, format)
worksheet.write_blank(0, 21, format)
worksheet.write_blank(0, 22, format)
worksheet.write_blank(0, 23, format)
worksheet.write_blank(0, 24, format)
worksheet.write_blank(0, 25, format)
worksheet.write_blank(0, 26, format)
worksheet.write_blank(0, 27, format)
worksheet.write_blank(0, 28, format)
#### for exporting into the search records 
#render :text => params[:data_check1].inspect and return
if !params[:data_check1].nil?
    params[:data_check1] = params[:data_check1].to_s.gsub("[","").gsub("]","")
    params[:data_check1].split(",").map do |can_id|
      @sales_genie_data = current_user.organization.sales_genie_data.where(:id => can_id.to_i)
      @sales_genie_data.each do |sales_genie_data|

        @data << ["#{sales_genie_data.up_date}", "#{sales_genie_data.good}","#{sales_genie_data.upload_date}","#{sales_genie_data.file}","#{sales_genie_data.phone_num}","#{sales_genie_data.company}", "#{sales_genie_data.contact}", "#{sales_genie_data.title}", "#{sales_genie_data.address}", "#{sales_genie_data.city}", "#{sales_genie_data.state}", "#{sales_genie_data.zip}", "#{sales_genie_data.area_code}", "#{sales_genie_data.emp_size}", "#{sales_genie_data.sales_volume}", "#{sales_genie_data.sic}", "#{sales_genie_data.sic_description}", "#{sales_genie_data.owner}", "#{sales_genie_data.cfo}", "#{sales_genie_data.controller}", "#{sales_genie_data.ap}", "#{sales_genie_data.ar}", "#{sales_genie_data.hr}","#{sales_genie_data.cio}", "#{sales_genie_data.it}", "#{sales_genie_data.sales_manager}", "#{sales_genie_data.last_updated_date}"]
      end  
    end
else
   @sales_genie_data = current_user.organization.sales_genie_data.all
    @sales_genie_data.each do |sales_genie_data|

      @data << ["#{sales_genie_data.up_date}", "#{sales_genie_data.good}","#{sales_genie_data.upload_date}","#{sales_genie_data.file}","#{sales_genie_data.phone_num}","#{sales_genie_data.company}", "#{sales_genie_data.contact}", "#{sales_genie_data.title}", "#{sales_genie_data.address}", "#{sales_genie_data.city}", "#{sales_genie_data.state}", "#{sales_genie_data.zip}", "#{sales_genie_data.area_code}", "#{sales_genie_data.emp_size}", "#{sales_genie_data.sales_volume}", "#{sales_genie_data.sic}", "#{sales_genie_data.sic_description}", "#{sales_genie_data.owner}", "#{sales_genie_data.cfo}", "#{sales_genie_data.controller}", "#{sales_genie_data.ap}", "#{sales_genie_data.ar}", "#{sales_genie_data.hr}","#{sales_genie_data.cio}", "#{sales_genie_data.it}", "#{sales_genie_data.sales_manager}", "#{sales_genie_data.last_updated_date}"]
    end 
  end
@rowsize = @data.size
worksheet.write(1, 1, "Good",heading)
worksheet.write(1, 2, "Upload Date",heading)
worksheet.write(1, 3, "File",heading)
worksheet.write(1, 4, "Phone#",heading)
worksheet.write(1, 5, "Company",heading)
worksheet.write(1, 6, "Contact",heading)
worksheet.write(1, 7, "Address",heading)
worksheet.write(1, 8, "City",heading)
worksheet.write(1, 9, "State",heading)
worksheet.write(1, 10, "Zip",heading)
worksheet.write(1, 11, "Zip",heading)
worksheet.write(1, 12, "Area Code",heading)
worksheet.write(1, 13, "Expiry Date",heading)
worksheet.write(1, 14, "Credit Rating Score",heading)
worksheet.write(1, 15, "Employee Size",heading)
worksheet.write(1, 16, "IUSA#",heading)
worksheet.write(1, 17, "FAX#",heading)
worksheet.write(1, 18, "Sales Volume",heading)
worksheet.write(1, 19, "SIC",heading)
worksheet.write(1, 20, "SIC Description",heading)
worksheet.write(1, 21, "Owner",heading)
worksheet.write(1, 22, "CFO",heading)
worksheet.write(1, 23, "Controller",heading)
worksheet.write(1, 24, "AP",heading)
worksheet.write(1, 25, "AR",heading)
worksheet.write(1, 26, "HR",heading)
worksheet.write(1, 27, "CIO",heading)
worksheet.write(1, 28, "IT",heading)
worksheet.write(1, 29, "Sales Manager",heading)
worksheet.add_table('B3:AA1048576',{ :data => @data,:header_row => 0 })
workbook.close


send_file("#{Rails.root}/public/uploads/sales_genie_data_info.xlsx", :type => "application/xlsx", :filename => "sales_genie_data_info.xlsx", :stream => true,:action =>"index")
File.delete("#{Rails.root}/public/uploads/sales_genie_data_info.xlsx")

end

def autocomplete_sales_genie_datum_state
    @sales_genie_data = SalesGenieDatum.where("state LIKE ?", "%#{params[:term]}%" ).pluck(:state)
    respond_to do |format|
        format.json { render json: @sales_genie_data.uniq }
      end
end
def autocomplete_sales_genie_datum_zip
    @sales_genie_data = SalesGenieDatum.where("zip LIKE ?", "%#{params[:term]}%" ).pluck(:zip)
    respond_to do |format|
        format.json { render json: @sales_genie_data.uniq }
      end
end
end
