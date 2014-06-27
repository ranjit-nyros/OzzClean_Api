require 'spec_helper'

describe "list_cleans/show" do
  before(:each) do
    @list_clean = assign(:list_clean, stub_model(ListClean,
      :source => "Source",
      :upload_by => "Upload By",
      :file_name => "MyText",
      :selection_query => "Selection Query",
      :cleaned_by => "Cleaned By",
      :no_of_records => 1,
      :no_of_good => 2,
      :qa_by => "Qa By",
      :qa_notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Source/)
    rendered.should match(/Upload By/)
    rendered.should match(/MyText/)
    rendered.should match(/Selection Query/)
    rendered.should match(/Cleaned By/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Qa By/)
    rendered.should match(/MyText/)
  end
end
