class Addfieldstotestsummaries < ActiveRecord::Migration
  def up
	add_column :test_summaries, :file, :string
	add_column :test_summaries, :notes, :string
  end

  def down
	remove_column :test_summaries, :file, :string
	remove_column :test_summaries, :notes, :string
  end
end
