class ListCleanPdf < Prawn::Document
 
	def initialize(list_cleans,username,view)
	#    super(:margin => [50,50,50,50])
	super(:page_size => [1000,1000]);
	@list_cleans = list_cleans;
	@username = username
	@view = view

	font "Helvetica"  
    	stroke_color '990088'
	headding
	start_new_page(:size => [1000,1000])
	contents_page
	
		page_count.times do |i|
    			go_to_page(i+1)   			
			draw_text "Page : #{i+1} / #{page_count}", :at=>[500,0]
draw_text "Printed On: " + "#{Date.today.strftime('%d/%m/%Y')}", :at=>[1,0]

 		end
				
	end #initialize

	def headding
		stroke do
			text "Printed on #{Date.today.strftime('%d/%m/%Y')}", :align => :right
			move_down 255
		  	horizontal_rule
		  	move_down 25
		
		  	text "ListCleans PDF REPORT", size: 25, style: :bold, align: :center, font: "Arial"
		  	move_down 25
		  	horizontal_rule
		  	move_down 40
		end

	end #headding

	def contents_page
		text "List Cleans", :heading => true, :align => :center, :size => 20, :font => "Helvetica"
		move_down 10
		listcleans = Array.new
		listcleans << ["Date", "Source", "Upload By", "File", "Selection Query","Cleaned By", "Clean Date","#Records", "#Good", "QA By", "QA Date", "QA Notes", "Status", "New File"]
		if !@list_cleans.blank?
		@list_cleans.each do |list_clean|
			file = File.basename(list_clean.file_name.path) if !list_clean.file_name.blank?
			newfile = File.basename(list_clean.newfile.path) if !list_clean.newfile.blank?
			listcleans << [list_clean.date, list_clean.source, list_clean.upload_by, file, list_clean.selection_query, list_clean.cleaned_by, list_clean.clean_date, list_clean.no_of_records, list_clean.no_of_good, list_clean.qa_by, list_clean.qa_date, list_clean.qa_notes, list_clean.status, newfile]
		end

		table(listcleans) do
		  
		  row(0).font_style = :bold
		  row(0).align = :center	  
		  self.row_colors = ["FFFFFF", "FFFFFF"]
		  self.header = true

		end
		else
			text "No List Cleans To Display", :font => "Arial", :size => 15
		end
	end #ideas

	end