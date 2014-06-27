require 'spec_helper'

describe "sales_genie_data/new" do
  before(:each) do
    assign(:sales_genie_datum, stub_model(SalesGenieDatum).as_new_record)
  end

  it "renders new sales_genie_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sales_genie_data_path, :method => "post" do
    end
  end
end
