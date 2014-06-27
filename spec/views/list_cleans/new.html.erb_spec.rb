require 'spec_helper'

describe "list_cleans/new" do
  before(:each) do
    assign(:list_clean, stub_model(ListClean,
      :source => "MyString",
      :upload_by => "MyString",
      :file_name => "MyText",
      :selection_query => "MyString",
      :cleaned_by => "MyString",
      :no_of_records => 1,
      :no_of_good => 1,
      :qa_by => "MyString",
      :qa_notes => "MyText"
    ).as_new_record)
  end

  it "renders new list_clean form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => list_cleans_path, :method => "post" do
      assert_select "input#list_clean_source", :name => "list_clean[source]"
      assert_select "input#list_clean_upload_by", :name => "list_clean[upload_by]"
      assert_select "textarea#list_clean_file_name", :name => "list_clean[file_name]"
      assert_select "input#list_clean_selection_query", :name => "list_clean[selection_query]"
      assert_select "input#list_clean_cleaned_by", :name => "list_clean[cleaned_by]"
      assert_select "input#list_clean_no_of_records", :name => "list_clean[no_of_records]"
      assert_select "input#list_clean_no_of_good", :name => "list_clean[no_of_good]"
      assert_select "input#list_clean_qa_by", :name => "list_clean[qa_by]"
      assert_select "textarea#list_clean_qa_notes", :name => "list_clean[qa_notes]"
    end
  end
end
