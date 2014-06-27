require 'csv'
require 'date'
class ListCleansController < ApplicationController
  # GET /list_cleans
  # GET /list_cleans.json
  def index
	@q = current_user.organization.list_cleans.search(params[:q])
        @list_cleans = @q.result(:distinct  => true).page(params[:page]).per(10)
	#@list_cleans = ListClean.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @list_cleans }
    end
  end

  # GET /list_cleans/1
  # GET /list_cleans/1.json
  def show
    @list_clean = ListClean.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list_clean }
    end
  end

  # GET /list_cleans/new
  # GET /list_cleans/new.json
  def new
    @list_clean = ListClean.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list_clean }
    end
  end

  # GET /list_cleans/1/edit
  def edit
    @list_clean = ListClean.find(params[:id])
  end

  # POST /list_cleans
  # POST /list_cleans.json
  def create
	puts params[:list_clean].inspect
    @list_clean = ListClean.new(params[:list_clean])
	@list_clean.user = current_user
    @list_clean.organization = current_user.organization
    @list_clean.date = change_date_format(params[:list_clean][:date]) if !(params[:list_clean][:date]).blank?
    @list_clean.qa_date = change_date_format(params[:list_clean][:qa_date]) if !(params[:list_clean][:qa_date]).blank?
    @list_clean.clean_date = change_date_format(params[:list_clean][:clean_date]) if !(params[:list_clean][:clean_date]).blank?

    respond_to do |format|
      if @list_clean.save
=begin
		path = File.join("#{Rails.root}","public",@list_clean.file_name.url)
		puts path.inspect
        	csv_text = File.read(path)
		csv_text = csv_text.gsub('"',"").gsub("'","")
		puts csv_text.inspect
		csv = CSV.parse open(File.join("#{Rails.root}","public",@list_clean.file_name.url)).read, :headers=>true, :converters=>:numeric
		#csv = CSV.parse(csv_text, :headers => true)
		
		puts csv.inspect
		puts csv.class
 		array1 = Array.new 
		puts csv[0]['Good']
 		csv.each do |row| 
                	array1 << ["#{row['Good']}","#{row['Upload Date']}","#{row['File']}"," #{row['Phone#']}"," #{row['Company']}"," #{row['Contact']}"," #{row['SIC']}"," #{row['Zip']}"," #{row['Area Code']}"," #{row['Address']}"," #{row['City']} ","#{row['State']}","#{row['SIC Description']}","#{row['Owner']}","#{row['CFO']}","#{row['Controller']}","#{row['AP']}","#{row['AR']}","#{row['HR']}","#{row['CIO']}","#{row['IT']}","#{row['Sales Manager']}"]
			end 
		puts array1.inspect
			array1.each_with_index do |k|
				if k[0] == "true"
				SalesGenieDatum.create(:good =>k[0],:upload_date=>DateTime.strptime("#{k[1]}", "%m-%d-%Y"),:file=>k[2],:phone_num=>k[3].to_i,:company =>k[4],:contact=>k[5],:sic=>k[6],:zip=>k[7],:area_code =>k[8],:address =>k[9],:city=>k[10],:state =>k[11] ,:sic_description => k[12] ,:owner => k[13],:cfo => k[14],:controller => k[15],:ap => k[16],:ar => k[17],:hr => k[18],:cio => k[19],:it => k[20],:sales_manager => k[21],:organization_id => @list_clean.organization_id ,:user_id => current_user.id,:list_clean_id => @list_clean.id)	
				end
    
				end # each do
=end
        	format.html { redirect_to @list_clean, notice: 'List clean was successfully created.' }
        	format.json { render json: @list_clean, status: :created, location: @list_clean }
      else
        	format.html { render action: "new" }
        	format.json { render json: @list_clean.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /list_cleans/1
  # PUT /list_cleans/1.json
  def update
    @list_clean = ListClean.find(params[:id])
#render :text => params[:list_clean][:file_name].inspect and return
    respond_to do |format|
    params[:list_clean][:date] = change_date_format(params[:list_clean][:date]) if !(params[:list_clean][:date]).blank?
    params[:list_clean][:qa_date] = change_date_format(params[:list_clean][:qa_date]) if !(params[:list_clean][:qa_date]).blank?
    params[:list_clean][:clean_date] = change_date_format(params[:list_clean][:clean_date]) if !(params[:list_clean][:clean_date]).blank?
	if params[:list_clean][:file_name] == nil
		params[:list_clean][:file_name] = nil
	end
	if params[:list_clean][:newfile] == nil
		params[:list_clean][:newfile] = nil
	end
      if @list_clean.update_attributes(params[:list_clean])
puts @list_clean.inspect
#render :text => @list_clean.inspect and return
        format.html { redirect_to @list_clean, notice: 'List clean was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list_clean.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_cleans/1
  # DELETE /list_cleans/1.json
  def destroy
    @list_clean = ListClean.find(params[:id])
    @list_clean.destroy

    respond_to do |format|
      format.html { redirect_to list_cleans_url }
      format.json { head :no_content }
    end
  end

  def search
   
puts params[:q][:date_cont]
puts params[:test]
#params[:q][:date] = params[:q][:date].to_date.strftime("%d/%Y/%m") if !(params[:q][:date]).blank?  

          params[:q][:date_cont] = change_date_format(params[:q][:date_cont]) if !(params[:q][:date_cont]).blank?
    params[:q][:date_cont] =  params[:q][:date_cont].to_date.strftime("%d/%Y/%m") if !(params[:q][:date_cont]).blank?  

params[:q][:date_gteq] = change_date_format(params[:q][:date_gteq]) if !(params[:q][:date_gteq]).blank?
     params[:q][:date_gteq] =  params[:q][:date_gteq].to_date.strftime("%d/%Y/%m") if !(params[:q][:date_gteq]).blank?   

params[:q][:date_lteq] = change_date_format(params[:q][:date_lteq]) if !(params[:q][:date_lteq]).blank?
     params[:q][:date_lteq] =  params[:q][:date_lteq].to_date.strftime("%d/%Y/%m") if !(params[:q][:date_lteq]).blank?    


params[:q][:clean_date] = params[:q][:clean_date].to_date.strftime("%d/%Y/%m") if !(params[:q][:clean_date]).blank?  

     params[:q][:clean_date_cont] = change_date_format(params[:q][:clean_date_cont]) if !(params[:q][:clean_date_cont]).blank?
     params[:q][:clean_date_cont] =  params[:q][:clean_date_cont].to_date.strftime("%d/%Y/%m") if !(params[:q][:clean_date_cont]).blank?  

params[:q][:clean_date_gteq] = change_date_format(params[:q][:clean_date_gteq]) if !(params[:q][:clean_date_gteq]).blank?
     params[:q][:clean_date_gteq] =  params[:q][:clean_date_gteq].to_date.strftime("%d/%Y/%m") if !(params[:q][:clean_date_gteq]).blank?   

params[:q][:clean_date_lteq] = change_date_format(params[:q][:clean_date_lteq]) if !(params[:q][:clean_date_lteq]).blank?
     params[:q][:clean_date_lteq] =  params[:q][:clean_date_lteq].to_date.strftime("%d/%Y/%m") if !(params[:q][:clean_date_lteq]).blank?


params[:q][:qa_date] = params[:q][:qa_date].to_date.strftime("%d/%Y/%m") if !(params[:q][:qa_date]).blank?  

     params[:q][:qa_date_cont] = change_date_format(params[:q][:qa_date_cont]) if !(params[:q][:qa_date_cont]).blank?
     params[:q][:qa_date_cont] =  params[:q][:qa_date_cont].to_date.strftime("%d/%Y/%m") if !(params[:q][:qa_date_cont]).blank?  

params[:q][:qa_date_gteq] = change_date_format(params[:q][:qa_date_gteq]) if !(params[:q][:qa_date_gteq]).blank?
     params[:q][:qa_date_gteq] =  params[:q][:qa_date_gteq].to_date.strftime("%d/%Y/%m") if !(params[:q][:qa_date_gteq]).blank?   

params[:q][:qa_date_lteq] = change_date_format(params[:q][:qa_date_lteq]) if !(params[:q][:qa_date_lteq]).blank?
     params[:q][:qa_date_lteq] =  params[:q][:qa_date_lteq].to_date.strftime("%d/%Y/%m") if !(params[:q][:qa_date_lteq]).blank?

    if params[:q]
    @q = current_user.organization.list_cleans.search(params[:q])
      @list_cleans = @q.result(:distinct  => true).page(params[:page]).per(10)
    end
    
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end
def view_pdf
  @list_cleans = current_user.organization.list_cleans.all
  pdf = ListCleanPdf.new(@list_cleans, current_user,view_context)
  send_data pdf.render, filename: "list_cleans.pdf",type: "application/pdf",disposition: "attachment"
end

def viewpdf
       @q = current_user.organization.list_cleans.search(params[:q])
        @list_cleans = @q.result
  # html = File.open("#{Rails.root}/app/views/list_cleans/view_pdf.html.erb")
  html = render_to_string('view_pdf.html.erb', :layout => false)
  puts html.inspect
#  render :text => html and return
  pdf = PDFKit.new(html, :print_media_type => true)
# Save the PDF to a file
file = pdf.to_pdf
 # file = pdf.to_file("#{Rails.root}/public/uploads/list_cleans.pdf")
send_data(file, :filename => "list_cleans.pdf", :type => "application/pdf", :disposition => "attachment")
end

end
