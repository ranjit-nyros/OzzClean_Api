class CreateListCleans < ActiveRecord::Migration
  def change
    create_table :list_cleans do |t|
      t.date :date
      t.string :source
      t.string :upload_by
      t.text :file_name
      t.string :selection_query
      t.string :cleaned_by
      t.date :clean_date
      t.integer :no_of_records
      t.integer :no_of_good
      t.string :qa_by
      t.date :qa_date
      t.text :qa_notes

      t.timestamps
    end
  end
end
