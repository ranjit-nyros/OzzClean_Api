class ListClean < ActiveRecord::Base
  	belongs_to :user
	belongs_to :organization

	has_many :sales_genie_data
	attr_accessible :clean_date, :cleaned_by, :date, :file_name, :no_of_good, :no_of_records, :qa_by, :qa_date, :qa_notes, :selection_query, :source, :upload_by, :user_id, :list_notes, :newfile, :status, :newfile_cache
	mount_uploader :file_name, ListCleanAttachmentUploader

	mount_uploader :newfile, NewfileUploader
	validates_presence_of :file_name


#   ransacker :no_of_records do
# Arel::Nodes::SqlLiteral.new("substring(CAST(list_cleans.no_of_records as CHAR(255)),length(no_of_records))")
# end

#    ransacker :no_of_good do
# Arel::Nodes::SqlLiteral.new("substring(CAST(list_cleans.no_of_good as CHAR(255)),length(no_of_good))")
# end
# def self.search1()
# ransacker :no_of_records do
#     Arel::Nodes::SqlLiteral.new(
#       "CAST(list_cleans.no_of_records as CHAR(12))"
#     )
#   end

#   ransacker :no_of_good do
#     Arel::Nodes::SqlLiteral.new(
#       "CAST(list_cleans.no_of_good as CHAR(12))"
#     )
# end
# end
end
