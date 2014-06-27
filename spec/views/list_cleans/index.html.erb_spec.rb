require 'spec_helper'

describe "list_cleans/index" do
  before(:each) do
    assign(:list_cleans, [
      stub_model(ListClean,
        :source => "Source",
        :upload_by => "Upload By",
        :file_name => "MyText",
        :selection_query => "Selection Query",
        :cleaned_by => "Cleaned By",
        :no_of_records => 1,
        :no_of_good => 2,
        :qa_by => "Qa By",
        :qa_notes => "MyText"
      ),
      stub_model(ListClean,
        :source => "Source",
        :upload_by => "Upload By",
        :file_name => "MyText",
        :selection_query => "Selection Query",
        :cleaned_by => "Cleaned By",
        :no_of_records => 1,
        :no_of_good => 2,
        :qa_by => "Qa By",
        :qa_notes => "MyText"
      )
    ])
  end

  it "renders a list of list_cleans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "Upload By".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Selection Query".to_s, :count => 2
    assert_select "tr>td", :text => "Cleaned By".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Qa By".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
